source('kugi5.R')
htmlTemplate(
  filename = "www/dashboard.html",
  
  select_geom = selectInput("shapeGeom", "Tipe data vektor", choices=c(`Titik`="_PT_", `Garis`="_LN_", `Poligon`="_AR_")),
  list_kugi = uiOutput("listOfKugi"),
  select_shp = fileInput("shpData", "Upload Shapefile", buttonLabel="Browse...", placeholder="No file selected", accept = c('zip', 'ZIP', 'ZIP (Archive File)', '.zip', '.ZIP'))
  
  
  
)