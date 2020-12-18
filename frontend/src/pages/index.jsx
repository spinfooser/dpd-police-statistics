import React, {Component} from 'react';
import * as d3 from "d3";
// markup
const IndexPage = () => {

    return (
        <div>
            <meta charSet="utf-8"></meta>
            <Histogram></Histogram>
        </div>
    );
};


export default IndexPage;

class Histogram extends Component {
    constructor(props) {
        super(props);
        this.myRef = React.createRef();
    }

    render() {
        return (
            <div ref={this.myRef} id='histogram'></div>
        );
    }

    drawChart = () => {

        const ctx = document.getElementById('histogram').getContext('2d');

        const chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: [0, 1, 2, 3, 4],
                datasets: [{
                    label: 'Number of Arrivals',
                    data: [19, 28, 20, 16],
                    backgroundColor: 'green',
                }]
            },
            options: {
                scales: {
                    xAxes: [{
                        display: false,
                        barPercentage: 1.3,
                        ticks: {
                            max: 3,
                        }
                    }, {
                        display: true,
                        ticks: {
                            autoSkip: false,
                            max: 4,
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
        console.log('blah');
        console.log('myref');
        console.log(this.myRef.current);
        // set the dimensions and margins of the graph
        var margin = {top: 10, right: 30, bottom: 30, left: 40},
            width = 460 - margin.left - margin.right,
            height = 400 - margin.top - margin.bottom;

        // append the svg object to the body of the page
        var svg = d3.select(this.myRef.current)
            .append("svg")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .append("g")
            .attr("transform",
                "translate(" + margin.left + "," + margin.top + ")");

        // get the data
        d3.csv("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/1_OneNum.csv", function (data) {

            // X axis: scale and draw:
            var x = d3.scaleLinear()
                .domain([0, 1000])     // can use this instead of 1000 to have the max of data: d3.max(data, function(d) { return +d.price })
                .range([0, width]);
            svg.append("g")
                .attr("transform", "translate(0," + height + ")")
                .call(d3.axisBottom(x));

            // set the parameters for the histogram
            var histogram = d3.histogram()
                .value(function (d) {
                    return d.price;
                })   // I need to give the vector of value
                .domain(x.domain())  // then the domain of the graphic
                .thresholds(x.ticks(70)); // then the numbers of bins

            // And apply this function to data to get the bins
            var bins = histogram(data);

            // Y axis: scale and draw:
            var y = d3.scaleLinear()
                .range([height, 0]);
            y.domain([0, d3.max(bins, function (d) {
                return d.length;
            })]);   // d3.hist has to be called before the Y axis obviously
            svg.append("g")
                .call(d3.axisLeft(y));

            console.log('bins');
            console.log(bins);

        });
    };


    componentDidMount() {
        this.drawChart();
    }
}

