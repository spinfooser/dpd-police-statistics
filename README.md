# DPD Police Statistics Project

Data analysis of Denver Police Department police statistics from 2010-2020.

## Setup

Run these commands to get the server started:
- `bundle install`
- `rake db:setup`
- `rake db:migrate`
- `rails s`

## Data Sources

Original Files:
- [DPD_Sworn_employees_7.1.10_to_6.30.20.xlsx](data_files/originals/DPD_Sworn_employees_7.1.10_to_6.30.20.xlsx)
- [All_Citizen_complaints_last_10_years.xlsx](data_files/originals/All_Citizen_complaints_last_10_years.xlsx)

These files were processed lightly to produce easily parseable CSV files.

CSV Versions:
- [officers.csv](data_files/officers.csv)
- [citizen_complaints.csv](data_files/citizen_complaints.csv)

## Data Discrepancies

### Officers.csv

Duplicate badge IDs were found for these officers in the officers.csv file:
- Nicholas Prisjatschew
- Jim Lopez
- Joseph Masztalics
- Alicia Martinez
- Daniel Eret
- Gregory Montanez
- Jonathan Davis
- Melissa Ballinger
- Phouratsamay Chanthavong
- Davin Munk
- Eric Morales
- Jared Bogacz
- Kyle Menssen
- Travis Lloyd
- Jesus Chavez
- Anastasia Moore
- Justin Jones

We kept the latest valid one in all cases. Many of these appear to be promotions, name
changes, etc.

`P13011,P13011,"Prisjatschew,Nicholas Valentine",CN2017 Security Ofcr,No,10/16/2010,`
`201554,P13011,Nicholas Prisjatschew,SP1011 Police Officer 1st Grade,No,1/11/2018,`

`P98062,P98062,"Lopez,Jim M.",SP1011 Police Officer 1st Grade,No,7/31/2010,`
`202376,P98062,Jim Lopez,SP1011 Police Officer 1st Grade,Yes,,`

`P08024,P08024,"Masztalics,Joseph Robert",SP1011 Police Officer 1st Grade,No,5/1/2011,`
`201520,P08024,Joseph Masztalics,SP1009 Detective,No,5/18/2019,`

`P15085,P15085,"Martinez,Alicia Dawn",CA2671 Victim Specialist,No,11/25/2012,`
`201806,P15085,Alicia Martinez,SP1011 Police Officer 1st Grade,Yes,,`

`P13100,P13100,"Eret,Daniel Ryan",CN2017 Security Ofcr,No,2/28/2013,`
`P13100,P13100,"Eret,Daniel Ryan",CN2017 Security Ofcr,No,12/21/2013,`
`201632,P13100,Daniel Eret,SP1011 Police Officer 1st Grade,Yes,,`

`P13014,P13014,"Montanez,Gregory Walden",CN2017 Security Ofcr,No,2/28/2013,`
`P13014,P13014,"Montanez,Gregory Walden",CN2017 Security Ofcr,No,4/23/2013,`
`201557,P13014,Gregory Montanez,SP1011 Police Officer 1st Grade,Yes,,`

`P13007,P13007,"Davis,Jonathan S",CN2566 NCIC Agent,No,4/27/2013,`
`201550,P13007,Jonathan Davis,SP1011 Police Officer 1st Grade,Yes,,`

`P13021,P13021,"Montoya,Melissa A.",CN2566 NCIC Agent,No,4/27/2013,`
`201564,P13021,Melissa Ballinger,SP1011 Police Officer 1st Grade,Yes,,`

`P00044,P00044,"Chanthavong,Phouratsamay",SP1011 Police Officer 1st Grade,No,7/21/2013,`
`201018,P00044,Phouratsamay Chanthavong,SP1011 Police Officer 1st Grade,Yes,,`

`P13080,P13080,"Munk,Davin G",CN2017 Security Ofcr,No,2/28/2013,`
`P13080,P13080,"Munk,Davin G",CN2017 Security Ofcr,No,12/28/2013,`
`P13080,P13080,"Munk,Davin G",SP1012 Police Officer 2nd Grade,No,6/10/2016,`

`P14100,P14100,"Morales,Eric",SP1014 Police Officer 4th Grade,No,5/3/2014,`
`201726,P14100,Eric Morales,SP1011 Police Officer 1st Grade,Yes,,`

`P14074,P14074,"Bogacz,Jared Anthony",CN2566 NCIC Agent,No,12/28/2014,`
`201702,P14074,Jared Bogacz,SP1009 Detective,Yes,,`

`P14075,P14075,"Menssen,Kyle Paul",SP1014 Police Officer 4th Grade,No,7/4/2015,`
`201703,P14075,Kyle Menssen,SP1011 Police Officer 1st Grade,Yes,,`

`P15022,P15022,"Lloyd,Travis Adam",CA2313 Operational Supv I,No,8/2/2015,`
`201747,P15022,Travis Lloyd,SP1009 Detective,Yes,,`

`P15080,P15080,"Galvan Chavez,Jesus Lorenzo",CJ2598 Stockkeeper I,No,12/27/2015,`
`201801,P15080,Jesus Galvan Chavez,SP1011 Police Officer 1st Grade,Yes,,`

`P15087,P15087,"Jones,Justin Raymond",CN2017 Security Ofcr,No,12/27/2015,`
`201807,P15087,Justin Jones,SP1011 Police Officer 1st Grade,Yes,,`

`P15079,P15079,"Moore,Anastasia Marta",CA2252 Mgmt Analyst II,No,12/27/2015,`
`201800,P15079,Anastasia Moore,SP1011 Police Officer 1st Grade,Yes,,`

## History
- **June 9th, 2020** - A Denver records request was initiated for information related to
  DPD officer rolls and all complaints in the last 10 years.
- **July 27th, 2020** - the records request was fulfilled for this data. I'd like to thank the
  Department of Public Safety for retrieving this data so quickly. Email transcript from
  Department of Public Safety relating to the 2 XLSX documents attached:

> Following a good faith search, we have attached what we have identified as potentially
> responsive.  The attached data took 10 hours to compile.  The HR portion of this request
> titled “DPD Sworn employees” took 5 hours to compile as we had to access and gather data
> from a total of 4 software programs, including legacy HR systems which have since been
> deactivated.  This data set shows the name, badge, rank and employment status.
>
> The second attachment titled “All Citizen complaints last 10 years” took an additional
> 5 hours related to civilian complaints against officers.  We cannot guarantee the accuracy
> of any data prior to March 2013 as it was transferred from a previous system, CUFFS, to
> our current system IAPro.  You will see those cases notated with a “z” in front of the
> Allegation and/or Directive.

- **August 14th, 2020** - Begin analyzing and getting data into a relational database. (Postgresql)