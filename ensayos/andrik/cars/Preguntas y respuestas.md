

# Ejercicio de análisis exploratorio de datos

Haz una copia de la carpeta "cars" a tu area de ensayo.

Vamos a realizar un análisis exploratorio de los datos contenido en el fichero Electric_Vehicle_Population_Data.csv.

El metadata del fichero es:

|Columna | Descripcion|
|----------|-----------|
|VIN (1-10)| Partial vehicle identification number consisting of the first 10 digits.|
|County| The county where the vehicle is registered.|
|City| The city where the vehicle is registered.|
|State| The state where the vehicle is registered.|
|Postal Code| The postal code of the vehicle registration location|
|Model Year| The year the vehicle was manufactured.|
|Make| The manufacturer or brand of the vehicle.|
|Model| The specific model of the vehicle.|
|Electric Vehicle Type| Indicates whether the vehicle is a Battery Electric Vehicle (BEV) or a Plug-in Hybrid Electric Vehicle (PHEV).|
|Clean Alternative Fuel Vehicle (CAFV) Eligibility| Indicates if the vehicle is eligible for Clean Alternative Fuel Vehicle benefits.|
|Electric Range| The range of the vehicle on a full electric charge.|
|Base MSRP| The manufacturer's suggested retail price for the vehicle.|
|Legislative District| The legislative district associated with the vehicle registration location.|
|DOL Vehicle ID| Unique identifier assigned by the Washington State Department of Licensing.|
|Vehicle Location| The precise location of the vehicle.|
|Electric Utility| The electric utility company associated with the vehicle.|
|2020 Census Tract| The census tract where the vehicle is registered.|

## ¿Cuántos registros hay en el fichero?

```bash
wc -l Electric_Vehicle_Population_Data.csv
```

## ¿De cuántos estados hay vehículos registrados?

```bash
cut -d';' -f4 Electric_Vehicle_Population_Data.csv | sort -u | grep -v State | wc -l
```
## ¿En que posición se encuentra la columna con el año de fabricación?

```bash
head -1 Electric_Vehicle_Population_Data.csv | sed -e "s/;/\n/g" | grep -n "Model Year"
```
## ¿En que año se fabricó el vehículo matriculado en Texas (TX)?

```bash
cut -d";" -f4,6 Electric_Vehicle_Population_Data.csv | grep -n TX
```
## ¿Cuál es el modelo de vehículo matriculado en Californía (CA)?

```bash
head -1 Electric_Vehicle_Population_Data.csv | sed -e "s/;/\n/g" | grep -n State
head -1 Electric_Vehicle_Population_Data.csv | sed -e "s/;/\n/g" | grep -n Model
cut -d";" -f4,8 Electric_Vehicle_Population_Data.csv | grep -n "CA;"
```
## ¿De cuántas ciudades del estado de Washigthon hay datos en el fichero?

```bash
head -1 Electric_Vehicle_Population_Data.csv | sed -e "s/;/\n/g" | grep -n City
head -1 Electric_Vehicle_Population_Data.csv | sed -e "s/;/\n/g" | grep -n State
cut -d";" -f3,4 Electric_Vehicle_Population_Data.csv | grep "WA" | sort -u | wc -l
```
## De los vehículos registrados en la ciudad de Shelton, el que tiene el mayor rango electrico, ¿cuántas millas puede recorrer?

```bash
cut -d";" -f3,11 Electric_Vehicle_Population_Data.csv | grep Shelton | sort -t';' -k2 -n | tail -1
```
## ¿Cuál es el DOL vehicle ID de ese vehículo que alcanza esa distancia máxima?

```bash
head -1 Electric_Vehicle_Population_Data.csv | sed -e "s/;/\n/g" | grep -n "DOL"
cut -d";" -f3,11,14 Electric_Vehicle_Population_Data.csv | grep Shelton | sort -t';' -k2 -n | tail -1
```
## ¿Cuáles son los fabricantes que tienen más de 4000 vehiculos registrados?

```bash
cut -d";" -f7 Electric_Vehicle_Population_Data.csv | sort | uniq -c | sort | awk '$1 > 4000'
```

## ¿Qué modelo de Nissan es lider en ventas?

```bash
head -1 Electric_Vehicle_Population_Data.csv | sed -e "s/;/\n/g" | grep -n State
head -1 Electric_Vehicle_Population_Data.csv | sed -e "s/;/\n/g" | grep -n Model
cut -d';' -f4,7,8 Electric_Vehicle_Population_Data.csv | sort | uniq -c | sort | grep NISSAN
```

## Ordena de mayor a menor autonomía promedio a los fabricantes

```bash
head -1 Electric_Vehicle_Population_Data.csv | sed -e "s/;/\n/g" | grep -n Make
head -1 Electric_Vehicle_Population_Data.csv | sed -e "s/;/\n/g" | grep -n "Electric Range"
cut -d';' -f7,11 Electric_Vehicle_Population_Data.csv | sort | uniq -c | sort | awk -F";" '{sum += $2; count++} END { print sum / count}'
```