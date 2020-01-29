###*Initiate Library####
library(shiny)
library(slickR)
library(splitstackshape)
library(XML)
library(stringr)
library(raster)
library(rgdal)
library(rgeos)
library(DBI)
library(RPostgreSQL)
library(rpostgis)
library(cleangeo)
library(DT)

library(leaflet)

###*Define Variables####
source('variables.R')
source('kugi5.R')

###*Setting Up Interface####
ui <- source('interface_html.R')

###*Preparing Server#### 
server <- function(input, output, session) {
  ###*Connect to PostgreSQL Database####
  # driver <- PostgreSQL(max.con = 100)
  driver <- dbDriver("PostgreSQL")
  
  pg_user<-"postgres"
  pg_host<-"localhost"
  pg_port<-"5432"
  pg_pwd<-"root"
  
  pg_raw_db<-"rawdata"
  pg_md_db<-"metadata"
  pg_kugi_db<-"kugi5"
  pg_comp_db<-"compilation"
  # pg_igd_db<-"IGD"
  # pg_int_db<-"integration"
  # pg_sync_db<-"sync"
  # pg_onemap_db<-"onemap"
  
  connectDB <- function(pg_db){
    tryCatch({
      dbConnect(driver, dbname=pg_db, host=pg_host, port=pg_port, user=pg_user, password=pg_pwd )
    }, error=function(e){
      print("Database connection failed")
      return(FALSE)
    })
  }
  
  disconnectDB <- function(name="Database", pg_db){
    print(paste0(name, " disconnected."))
    dbDisconnect(pg_db)
  }
  
  countMetadataTbl <- function(){
    metadata<-connectDB(pg_md_db)
    count_metadata <- dbGetQuery(metadata, "select count(id_metadata) from metadata;")
    disconnectDB("metadata", metadata)
    
    return(count_metadata)
  }
  
  countCompTbl <- function(){
    compilation<-connectDB(pg_comp_db)
    count_compilation <- length(dbListTables(compilation))-3
    disconnectDB("compilation", compilation)
    
    return(count_compilation)
  }
  
  getMetadataTbl <- function(){
    # return(dbReadTable(DB, c("public", "metadata")))
    metadata<-connectDB(pg_md_db)
    tblMetadata <- dbGetQuery(metadata, "select file_identifier, individual_name, organisation_name, approval, status from metadata;")
    disconnectDB("metadata", metadata)
    
    return(tblMetadata)
  }
  
  listOfTbl <- reactiveValues(metadata=getMetadataTbl(),
                              numOfMetadata=countMetadataTbl(),
                              numOfCompilated=countCompTbl(),
                              # numOfIntegrated=countIntTbl(),
                              recentMetadata=data.frame(),
                              selectedRawdata="",
                              recentValidityData=data.frame(),
                              initialKugi="",
                              initialShp="",
                              tableKugi="",
                              recentTableWithKugi=data.frame(),
                              recentAttributeTable=NULL,
                              recentAttributeKugi=NULL,
                              listMatch=data.frame())
  
 
  output$countData <- renderUI({
	tags$div(class="row counters",
		tags$div(class="col-lg-3 col-6 text-center", 
			tags$span(`data-toggle`="counter-up", listOfTbl$numOfMetadata$count),
			tags$p("Total Data")
		),
		tags$div(class="col-lg-3 col-6 text-center", 
			tags$span(`data-toggle`="counter-up", listOfTbl$numOfCompilated),
			tags$p("Data Terkompilasi")
		),
		tags$div(class="col-lg-3 col-6 text-center", 
			tags$span(`data-toggle`="counter-up", listOfTbl$numOfMetadata$count),
			tags$p("Data Terintegrasi")
		),
		tags$div(class="col-lg-3 col-6 text-center", 
			tags$span(`data-toggle`="counter-up", listOfTbl$numOfCompilated),
			tags$p("Data Tersinkronisasi")
		)
	)
	
  })
  
  output$listOfKugi <- renderUI({
    selectInput("kugiName", "Katalog Unsur Geografi Indonesia", choices=sort(as.character(katalogdata[grep(input$shapeGeom, katalogdata$KUGI),])), selectize=FALSE)
  })
  
}

###*Run the application#### 
shinyApp(ui = ui, server = server)