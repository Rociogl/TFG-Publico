# TFG- Web

http://shiny.uclm.es/apps/tfg/rocio/

Web - Segmentación de municipios en función de su Vulnerabilidad Socioeconómica, Sociodemográfica y Residencial
mar. de 2019 – actualidad

Descripción del proyectoPara llevar a cabo esta segmentación, se utiliza una base de datos extraída del Atlas de Vulnerabilidad Urbana elaborado por el Ministerio de Fomento, a partir de los datos del Censo de Población y Viviendas de 2011.

El Censo de Población y Viviendas solamente se actualiza cada 10 años, por ello la base de datos utilizada es del año 2011. Sin embargo, resulta interesante analizar estos datos ya que permiten mostrar una fotografía estructural de la Vulnerabilidad Urbana en España.

Para llevar a cabo el análisis se seleccionan 19 variables basadas en tres tipos de Vulnerabilidad: Socioeconómica, Sociodemográfica y Residencial. Estas variables permiten medir la debilidad de la estructura demográfica y familiar, las condiciones del mercado laboral, la cualificación de la población y la calidad de las viviendas.

La base de datos utilizada está compuesta por un total de 35.917 observaciones, las cuales son secciones censales para el año 2011. Para llevar a cabo el análisis cluster se reducen a 8.116 observaciones, que corresponden con los municipios registrados en dicho periodo. El proceso consiste en determinar para cada municipio el valor medio de sus correspondientes secciones censales, construyendo un indicador global de Vulnerabilidad para cada cluster.

Se crea una página web con el fin de identificar de manera sencilla a que cluster pertenece cada municipio de manera interactiva y sencilla.


# TFG - Resumen

En esta investigación, en primer lugar, se lleva a cabo una segmentación de municipios según su Vulnerabilidad Socioeconómica, Sociodemográfica y Residencial, se detectan para el caso de España 5 claras regiones. Con ello se elabora una página web interactiva en la que se pueden visualizar los diferentes municipios existentes y caracterizarlos en función del segmento al que pertenecen.
En segundo lugar, dichos segmentos se elaboran con una finalidad de doble vertiente. Por un lado, se utilizan como variable predictora en un sistema experto elaborado por la empresa de tasaciones CoHispania, colaboradora en esta investigación, para evaluar como repercute en sus resultados. Por otro lado, dicha segmentación se desarrolla con el objetivo de crear modelos locales a la hora de elaborar un prototipo de Modelo Automatizado de Valoración (AVM) basado en técnicas de Machine Learning.
Para llevar a cabo su creación se aplican técnicas de ensemble, compuestas por algoritmos de árboles de regresión. En cuanto a las métricas de evaluación se emplean las establecidas en la guía que propone el Banco de España, resultando Random Forest cómo la mejor técnica a aplicar. Los resultados obtenidos son prometedores, ya que son similares a los que se obtienen en entornos de producción.
