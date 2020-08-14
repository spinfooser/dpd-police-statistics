# DPD Police Statistics Project

Data analysis of Denver Police Department police statistics from 2010-2020.

## Setup

Run these commands to get started:
- 

## Data Sources

Original Files:
- [DPD_Sworn_employees_7.1.10_to_6.30.20.xlsx](data_files/originals/DPD_Sworn_employees_7.1.10_to_6.30.20.xlsx)
- [All_Citizen_complaints_last_10_years.xlsx](data_files/originals/All_Citizen_complaints_last_10_years.xlsx)

These files were processed lightly to produce easily parseable CSV files.

CSV Versions:
- [officers.csv](data_files/officers.csv)
- [citizen_complaints.csv](data_files/citizen_complaints.csv)

## History
- **June 9th, 2020** - A Denver records request was initiated for information related to
  DPD officer rolls and all complaints in the last 10 years.
- **July 27th, 2020** - the records request was fulfilled for this data. Thanks to the
  Department of Public Safety for retrieving this data. Email transcript from Department of
  Public Safety relating to the 2 XLSX documents attached:

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