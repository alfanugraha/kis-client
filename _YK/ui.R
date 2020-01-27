htmlTemplate("index-test.html",
             count_data = uiOutput("countData"),
             data_type = selectInput("shapeGeom", "Tipe data vektor", choices=c(`Titik`="_PT_", `Garis`="_LN_", `Poligon`="_AR_")),
             kugi = uiOutput("listOfKugi"),
             upload_file = fileInput("shpData", "Upload Shapefile", buttonLabel="Browse...", placeholder="No file selected", accept = c('zip', 'ZIP', 'ZIP (Archive File)', '.zip', '.ZIP')),
             save_button = actionButton("saveButton", "Simpan"),
             
             refresh_button = actionButton("refreshButton", "Refresh"),
             comp_table = dataTableOutput("comp_data"),
             
             raw_title = h1(textOutput("rawTitle")),
             original_attribute = uiOutput("listOfShpColumn"),
             kugi_attribute = uiOutput("listOfKugiAttrib"),
             match_button = actionButton("matchButton", "Padu Padan"),
             compile_button = actionButton("finishMatchButton", "Kompilasi"),
             edit_comp_table = rHandsontableOutput("editAttribute"),
             
             list_comp_data = uiOutput("listOfCompData"),
             list_igd_data = uiOutput("listOfIgdData"),
             union_button = actionButton("unionButton", "Union"),
             leaflet = leafletOutput("map",height = 650),
             
             list_intg_data = uiOutput("listOfIntgData"),
             load_button = actionButton("generateSelectedInt", "Muat atribut"),
             intg_table = rHandsontableOutput("integration_data"),
             intg_button = actionButton("integrationButton", "Integrasi"),
             
             checkbox_data_tatakan = checkboxGroupInput("dataTatakan", label = h3("Data Tatakan dan Izin"),
                                                        choices = list("Penunjukkan OKI"="Penunjukan_OKI", "Penunjukkan Sumatera Selatan"="Penunjukan_Sumsel", "Pola Ruang OKI"="Pola_Ruang_OKI", "Pola Ruang Sumatera Selatan"="polaruang_sumsel"),
                                                        selected = c("Penunjukan_OKI", "Penunjukan_Sumsel")),
             list_intgSync_data = uiOutput("listOfIntgSyncData"),
             unionSync_button = actionButton("unionSyncButton", "Union"),
             leafletSync = leafletOutput("mapSync",height = 650),
             
             list_sync_data = uiOutput("listOfSyncData"),
             loadSync_button = actionButton("generateSelectedSync", "Muat atribut"),
             sync_table = rHandsontableOutput("syncData"),
             sync_button = actionButton("integrationButton", "Sync"),
             
             satu_peta_table =  dataTableOutput("satuPetaData") 
             
             )