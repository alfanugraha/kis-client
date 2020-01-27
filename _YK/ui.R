htmlTemplate("index.html", 
             count_data = uiOutput("countData"),
             data_type = selectInput("shapeGeom", "Tipe data vektor", choices=c(`Titik`="_PT_", `Garis`="_LN_", `Poligon`="_AR_")),
             kugi = uiOutput("listOfKugi"),
             upload_file = fileInput("shpData", "Upload Shapefile", buttonLabel="Browse...", placeholder="No file selected", accept = c('zip', 'ZIP', 'ZIP (Archive File)', '.zip', '.ZIP')),
             save_button = actionButton("saveButton", "Simpan"),
             refresh_button = actionButton("refreshButton", "Refresh"),
             comp_table = dataTableOutput("comp_data"),
             original_attribute = uiOutput("listOfShpColumn"),
             kugi_attribute = uiOutput("listOfKugiAttrib"),
             match_button = actionButton("matchButton", "Padu Padan"),
             compile_button = actionButton("finishMatchButton", "Kompilasi"),
             edit_comp_table = rHandsontableOutput("editAttribute")
             )