# googleVis - Visualiza��es Interativas

# Baseado no GOogle Chart (visualiza��o de dados na web), googlevis � um pacote que fornece interface entre R e o Google Charts.
# Utiliza javaScript e arquivos JSON. Os dados s�o transformados em formato JSON.
# O resultado � gerado em HTML5 ou Flash.
# Pode-se criar os mais variados tipos de fr�gicos e mapas. Inclusive Google Maps.
# Voc� pode incorporar os gr�ficos criados em p�ginas HTML ou apps.
# Verificar os termos de uso antes de utilizar.

install.packages('googleVis')
library(googleVis)

# Criando um Dataframe
df = data.frame(Pa�s = c("BR", "CH", "AR"),
                Exporta��es = c(10,13,14),
                Importa��es = c(23,12,32))

# Gr�fico de Linha
Line <- gvisLineChart(df)
plot(Line)


# Gr�fico de Barras
Column <- gvisColumnChart(df)
plot(Column)


# Gr�fico de Barras Horizontais
Bar <- gvisBarChart(df)
plot(Bar)


# Gr�fico de Pizza
Pie <- gvisPieChart(CityPopularity)
plot(Pie)

# Gr�ficos Combinados
Combo <- gvisComboChart(df, xvar = 'Pa�s',
                        yvar = c('Exporta��es', 'Importa��es'),
                        options = list(seriesType = 'bars',
                                       series = '{1: {type:"line}}'))
plot(Combo)

# Scatter Chart
Scatter <- gvisScatterChart(women, 
                            options=list(
                              legend="none",
                              lineWidth=2, pointSize=0,
                              title="Women", vAxis="{title:'weight (lbs)'}",
                              hAxis="{title:'height (in)'}", 
                              width=300, height=300))
plot(Scatter)


# Bubble
Bubble <- gvisBubbleChart(Fruits, idvar="Fruit", 
                          xvar="Sales", yvar="Expenses",
                          colorvar="Year", sizevar="Profit",
                          options=list(
                            hAxis='{minValue:75, maxValue:125}'))
plot(Bubble)


# Customizando
M <- matrix(nrow=6,ncol=6)
M[col(M)==row(M)] <- 1:6
dat <- data.frame(X=1:6, M)
SC <- gvisScatterChart(dat, 
                       options=list(
                         title="Customizing points",
                         legend="right",
                         pointSize=30,
                         series="{
                         0: { pointShape: 'circle' },
                         1: { pointShape: 'triangle' },
                         2: { pointShape: 'square' },
                         3: { pointShape: 'diamond' },
                         4: { pointShape: 'star' },
                         5: { pointShape: 'polygon' }
                         }"))
plot(SC)


# Gauge
Gauge <-  gvisGauge(CityPopularity, 
                    options=list(min=0, max=800, greenFrom=500,
                                 greenTo=800, yellowFrom=300, yellowTo=500,
                                 redFrom=0, redTo=300, width=400, height=300))
plot(Gauge)


# Mapas
Intensity <- gvisIntensityMap(df)
plot(Intensity)


# Geo Chart
Geo=gvisGeoChart(Exports, locationvar="Country", 
                 colorvar="Profit",
                 options=list(projection="kavrayskiy-vii"))
plot(Geo)


# Google Maps
AndrewMap <- gvisMap(Andrew, "LatLong" , "Tip", 
                     options=list(showTip=TRUE, 
                                  showLine=TRUE, 
                                  enableScrollWheel=TRUE,
                                  mapType='terrain', 
                                  useMapTypeControl=TRUE))
plot(AndrewMap)


# Dados em Gráfico. Nível de analfabetismo nos EUA
require(datasets)
states <- data.frame(state.name, state.x77)
GeoStates <- gvisGeoChart(states, "state.name", "Illiteracy",
                          options=list(region="US", 
                                       displayMode="regions", 
                                       resolution="provinces",
                                       width=600, height=400))
plot(GeoStates)



# Mais exemplos
demo(googleVis)