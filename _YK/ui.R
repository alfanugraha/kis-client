htmlTemplate("index.html",
             countData = uiOutput("countData"),
             shapeGeom = selectInput("shapeGeom", "Tipe data vektor", choices=c(`Titik`="_PT_", `Garis`="_LN_", `Poligon`="_AR_")),
             listOfKugi = uiOutput("listOfKugi"),
             shpData = fileInput("shpData", "Upload Shapefile", buttonLabel="Browse...", placeholder="No file selected", accept = c('zip', 'ZIP', 'ZIP (Archive File)', '.zip', '.ZIP')),
             saveButton = actionButton("saveButton", "Simpan"),
             
             refreshButton = actionButton("refreshButton", "Refresh"),
             
             rawTitle = h1(textOutput("rawTitle")),
             listOfShpColumn = uiOutput("listOfShpColumn"),
             listOfKugiAttrib = uiOutput("listOfKugiAttrib"),
             matchButton = actionButton("matchButton", "Padu Padan"),
             finishMatchButton = actionButton("finishMatchButton", "Kompilasi"),
             editAttribute = rHandsontableOutput("editAttribute"),
             
             listOfCompData = uiOutput("listOfCompData"),
             listOfIgdData = uiOutput("listOfIgdData"),
             unionButton = actionButton("unionButton", "Union"),
             map = leafletOutput("map",height = 650),
             
             listOfIntgData = uiOutput("listOfIntgData"),
             generateSelectedInt = actionButton("generateSelectedInt", "Muat atribut"),
             integration_data = rHandsontableOutput("integration_data"),
             integrationButton = actionButton("integrationButton", "Integrasi"),
             
             checkbox_data_tatakan = checkboxGroupInput("dataTatakan", label = h3("Data Tatakan dan Izin"),
                                                        choices = list("Penunjukkan OKI"="Penunjukan_OKI", "Penunjukkan Sumatera Selatan"="Penunjukan_Sumsel", "Pola Ruang OKI"="Pola_Ruang_OKI", "Pola Ruang Sumatera Selatan"="polaruang_sumsel"),
                                                        selected = c("Penunjukan_OKI", "Penunjukan_Sumsel")),
             listOfIntgSyncData = uiOutput("listOfIntgSyncData"),
             unionSyncButton = actionButton("unionSyncButton", "Union"),
             mapSync = leafletOutput("mapSync",height = 650),
             
             listOfSyncData = uiOutput("listOfSyncData"),
             generateSelectedSync = actionButton("generateSelectedSync", "Muat atribut"),
             syncData = rHandsontableOutput("syncData"),
             integrationButton = actionButton("integrationButton", "Sync"),
             
             satuPetaData =  dataTableOutput("satuPetaData") 
             
             )