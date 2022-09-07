rm(list=ls())

require(pacman)
p_load(rio,skimr,janitor,dplyr)

data_csv = import(file="input/datos_censo.csv" , skip=6 , encoding="UTF-8") 

data_xls = import(file="input/datos_excel.xlsx" , skip=9)
data_xls=import(file="input")

export(x=data_csv, file="output/data_csv.csv")
export(x=data_xls , file="output/data_excel.xlsx")
export(x=data_xls , file="output/data_r.rds")

convert(in_file="input/datos_censo.csv", out_file="output/datos_convert.rds")
##explorar bases de datos
data(package="dplyr")

db=as_tibble(x=starwars)

db

head(x=db, n=7)

tail(db)
str(db)

str(data_csv)

skim(data=db)

db=rename(.data=db, weight=mass, height_cm=height)

colnames (db)

colnames(db)[9]="genero"

df=select_all(.tbl=db,toupper)

data_csv2=clean_names(data_csv)
##clean_names quita espacios, acentos, etc
