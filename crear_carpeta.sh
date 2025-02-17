echo "Ingrese el nombre de la carpeta que desea crear en este directorio donde instalara las librerias: jupyter notebook, api con mysql, api con postgres"
read carpeta
mkdir $carpeta
cd $carpeta
#creo el virtual environmente
python3 -m venv .venv
source .venv/bin/activate

#libreria de API con mysql
pip install mysql-connector-python

#Para instalar la API de python con postgres
pip install psycopg2

#para instalar el jupyter notebook
pip install notebook
