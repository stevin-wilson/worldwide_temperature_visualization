#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(shinythemes)
library(viridis)
library(lubridate)

city.options <- c("Calgary, Canada",
                  "Edmonton, Canada",
                  "Halifax, Canada",
                  "Montreal, Canada",
                  "Ottawa, Canada",
                  "Quebec, Canada",
                  "Regina, Canada",
                  "Toronto, Canada",
                  "Vancouver, Canada",
                  "Winnipeg, Canada",
                  "Guadalajara, Mexico",
                  "Mexico City, Mexico",
                  "Monterrey, Mexico",
                  "Birmingham, Alabama",
                  "Huntsville, Alabama",
                  "Mobile, Alabama",
                  "Montgomery, Alabama",
                  "Anchorage, Alaska",
                  "Fairbanks, Alaska",
                  "Juneau, Alaska",
                  "Flagstaff, Arizona",
                  "Phoenix, Arizona",
                  "Tucson, Arizona",
                  "Yuma, Arizona",
                  "Fort Smith, Arkansas",
                  "Little Rock, Arkansas",
                  "Fresno, California",
                  "Los Angeles, California",
                  "Sacramento, California",
                  "San Diego, California",
                  "San Francisco, California",
                  "Colorado Springs, Colorado",
                  "Denver, Colorado",
                  "Grand Junction, Colorado",
                  "Pueblo, Colorado",
                  "Bridgeport, Connecticut",
                  "Hartford Springfield, Connecticut",
                  "Wilmington, Delaware",
                  "Washington, District of Columbia ",
                  "Daytona Beach, Florida",
                  "Jacksonville, Florida",
                  "Miami Beach, Florida",
                  "Orlando, Florida",
                  "Tallahassee, Florida",
                  "Tampa St. Petersburg, Florida",
                  "West Palm Beach, Florida",
                  "Atlanta, Georgia",
                  "Columbus, Georgia",
                  "Macon, Georgia",
                  "Savannah, Georgia",
                  "Honolulu, Hawaii",
                  "Boise, Idaho",
                  "Pocatello, Idaho",
                  "Chicago, Illinois",
                  "Peoria, Illinois",
                  "Rockford, Illinois",
                  "Springfield, Illinois",
                  "Evansville, Indiana",
                  "Fort Wayne, Indiana",
                  "Indianapolis, Indiana",
                  "South Bend, Indiana",
                  "Des Moines, Iowa",
                  "Sioux City, Iowa",
                  "Goodland, Kansas",
                  "Topeka, Kansas",
                  "Wichita, Kansas",
                  "Lexington, Kentucky",
                  "Louisville, Kentucky",
                  "Paducah, Kentucky",
                  "Baton Rouge, Louisiana",
                  "Lake Charles, Louisiana",
                  "New Orleans, Louisiana",
                  "Shreveport, Louisiana",
                  "Caribou, Maine",
                  "Portland, Maine",
                  "Baltimore, Maryland",
                  "Washington DC, Maryland",
                  "Boston, Massachusetts",
                  "Detroit, Michigan",
                  "Flint, Michigan",
                  "Grand Rapids, Michigan",
                  "Lansing, Michigan",
                  "Sault Ste Marie, Michigan",
                  "Duluth, Minnesota",
                  "Minneapolis St. Paul, Minnesota",
                  "Jackson, Mississippi",
                  "Tupelo, Mississippi",
                  "Kansas City, Missouri",
                  "Springfield, Missouri",
                  "St Louis, Missouri",
                  "Billings, Montana",
                  "Great Falls, Montana",
                  "Helena, Montana",
                  "Lincoln, Nebraska",
                  "North Platte, Nebraska",
                  "Omaha, Nebraska",
                  "Reno, Nevada",
                  "Las Vegas, Nevada",
                  "Concord, New Hampshire",
                  "Atlantic City, New Jersey",
                  "Newark, New Jersey",
                  "Albuquerque, New Mexico",
                  "Albany, New York",
                  "Buffalo, New York",
                  "New York City, New York",
                  "Rochester, New York",
                  "Syracuse, New York",
                  "Asheville, North Carolina",
                  "Charlotte, North Carolina",
                  "Greensboro, North Carolina",
                  "Raleigh Durham, North Carolina",
                  "Bismarck, North Dakota",
                  "Fargo, North Dakota",
                  "Akron Canton, Ohio",
                  "Cincinnati, Ohio",
                  "Cleveland, Ohio",
                  "Columbus, Ohio",
                  "Dayton, Ohio",
                  "Toledo, Ohio",
                  "Youngstown, Ohio",
                  "Oklahoma City, Oklahoma",
                  "Tulsa, Oklahoma",
                  "Eugene, Oregon",
                  "Medford, Oregon",
                  "Portland, Oregon",
                  "Salem, Oregon",
                  "Allentown, Pennsylvania",
                  "Erie, Pennsylvania",
                  "Harrisburg, Pennsylvania",
                  "Philadelphia, Pennsylvania",
                  "Pittsburgh, Pennsylvania",
                  "Wilkes Barre, Pennsylvania",
                  "Rhode Island, Rhode Island",
                  "Charleston, South Carolina",
                  "Columbia, South Carolina",
                  "Rapid City, South Dakota",
                  "Sioux Falls, South Dakota",
                  "Chattanooga, Tennessee",
                  "Knoxville, Tennessee",
                  "Memphis, Tennessee",
                  "Nashville, Tennessee",
                  "Abilene, Texas",
                  "Amarillo, Texas",
                  "Austin, Texas",
                  "Brownsville, Texas",
                  "Corpus Christi, Texas",
                  "Dallas Ft Worth, Texas",
                  "El Paso, Texas",
                  "Houston, Texas",
                  "Lubbock, Texas",
                  "Midland Odessa, Texas",
                  "San Angelo, Texas",
                  "San Antonio, Texas",
                  "Waco, Texas",
                  "Wichita Falls, Texas",
                  "Salt Lake City, Utah",
                  "Burlington, Vermont",
                  "Norfolk, Virginia",
                  "Richmond, Virginia",
                  "Roanoke, Virginia",
                  "Seattle, Washington",
                  "Spokane, Washington",
                  "Yakima, Washington",
                  "Charleston, West Virginia",
                  "Elkins, West Virginia",
                  "Green Bay, Wisconsin",
                  "Madison, Wisconsin",
                  "Milwaukee, Wisconsin",
                  "Casper, Wyoming",
                  "Cheyenne, Wyoming",
                  "San Juan Puerto Rico",
                  "Algiers, Algeria",
                  "Bujumbura, Burundi",
                  "Cotonou, Benin",
                  "Bangui, Central African Republic",
                  "Brazzaville, Congo",
                  "Cairo, Egypt",
                  "Addis Ababa, Ethiopia",
                  "Libreville, Gabon",
                  "Banjul, Gambia",
                  "Conakry, Guinea",
                  "Bissau, Guinea-Bissau",
                  "Abidjan, Ivory Coast",
                  "Nairobi, Kenya",
                  "Rabat, Morocco",
                  "Antananarivo, Madagascar",
                  "Nouakchott, Mauritania",
                  "Lilongwe, Malawi",
                  "Maputo, Mozambique",
                  "Windhoek, Namibia",
                  "Niamey, Nigeria",
                  "Lagos, Nigeria",
                  "Dakar, Senegal",
                  "Freetown, Sierra Leone",
                  "Capetown, South Africa",
                  "Lome, Togo",
                  "Tunis, Tunisia",
                  "Dar Es Salaam, Tanzania",
                  "Kampala, Uganda",
                  "Lusaka, Zambia",
                  "Dhaka, Bangladesh",
                  "Beijing, China",
                  "Chengdu, China",
                  "Guangzhou, China",
                  "Shanghai, China",
                  "Shenyang, China",
                  "Hong Kong, Hong Kong",
                  "Bombay, India",
                  "Calcutta, India",
                  "Chennai, India",
                  "Delhi, India",
                  "Jakarta, Indonesia",
                  "Osaka, Japan",
                  "Sapporo, Japan",
                  "Tokyo, Japan",
                  "Almaty, Kazakhstan",
                  "Bishkek, Kyrgyzstan",
                  "Vientiane, Laos",
                  "Kuala Lumpur, Malaysia",
                  "Ulan-bator, Mongolia",
                  "Rangoon, Myanmar",
                  "Katmandu, Nepal",
                  "Pyongyang, North Korea",
                  "Islamabad, Pakistan",
                  "Karachi, Pakistan",
                  "Manila, Philippines",
                  "Singapore, Singapore",
                  "Seoul, South Korea",
                  "Colombo, Sri Lanka",
                  "Taipei, Taiwan",
                  "Dusanbe, Tajikistan",
                  "Bangkok, Thailand",
                  "Ashabad, Turkmenistan",
                  "Tashkent, Uzbekistan",
                  "Hanoi, Vietnam",
                  "Brisbane, Australia",
                  "Canberra, Australia",
                  "Melbourne, Australia",
                  "Perth, Australia",
                  "Sydney, Australia",
                  "Auckland, New Zealand",
                  "Tirana, Albania",
                  "Vienna, Austria",
                  "Minsk, Belarus",
                  "Brussels, Belgium",
                  "Sofia, Bulgaria",
                  "Zagreb, Croatia",
                  "Nicosia, Cyprus",
                  "Prague, Czech Republic",
                  "Copenhagen, Denmark",
                  "Helsinki, Finland",
                  "Paris, France",
                  "Bordeaux, France",
                  "Bonn, Germany",
                  "Frankfurt, Germany",
                  "Hamburg, Germany",
                  "Munich, Germany",
                  "Tbilisi, Georgia",
                  "Athens, Greece",
                  "Budapest, Hungary",
                  "Reykjavik, Iceland",
                  "Dublin, Ireland",
                  "Milan, Italy",
                  "Rome, Italy",
                  "Riga, Latvia",
                  "Skopje, Macedonia",
                  "Amsterdam, The Netherlands",
                  "Oslo, Norway",
                  "Warsaw, Poland",
                  "Lisbon, Portugal",
                  "Bucharest, Romania",
                  "Moscow, Russia",
                  "Yerevan, Russia",
                  "Pristina, Serbia-Montenegro",
                  "Bratislava, Slovakia",
                  "Barcelona, Spain",
                  "Bilbao, Spain",
                  "Madrid, Spain",
                  "Stockholm, Sweden",
                  "Bern, Switzerland",
                  "Geneva, Switzerland",
                  "Zurich, Switzerland",
                  "Kiev, Ukraine",
                  "Belfast, United Kingdom",
                  "London, United Kingdom",
                  "Belgrade, Yugoslavia",
                  "Manama, Bahrain",
                  "Tel Aviv, Israel",
                  "Amman, Jordan",
                  "Kuwait, Kuwait",
                  "Beirut, Lebanon",
                  "Muscat, Oman",
                  "Doha, Qatar",
                  "Dhahran, Saudi Arabia",
                  "Riyadh, Saudi Arabia",
                  "Damascus, Syria",
                  "Ankara, Turkey",
                  "Istanbul, Turkey",
                  "Abu Dhabi, United Arab Emirates",
                  "Dubai, United Arab Emirates",
                  "Buenos Aires, Argentina",
                  "Nassau, Bahamas",
                  "Hamilton, Bermuda",
                  "Belize City, Belize",
                  "La Paz, Bolivia",
                  "Bridgetown, Barbados",
                  "Brasilia, Brazil",
                  "Rio de Janeiro, Brazil",
                  "Sao Paulo, Brazil",
                  "Bogota, Colombia",
                  "San Jose, Costa Rica",
                  "Havana, Cuba",
                  "Santo Domingo, Dominican Republic",
                  "Guayaquil, Equador",
                  "Quito, Equador",
                  "Guatemala City, Guatemala",
                  "Georgetown, Guyana",
                  "Port au Prince, Haiti",
                  "Tegucigalpa, Honduras",
                  "Managua, Nicaragua",
                  "Panama City, Panama",
                  "Lima, Peru",
                  "Paramaribo, Suriname",
                  "Montvideo, Uruguay",
                  "Caracas, Venezuela")

year.options <- as.character(seq(2020, 1995, -1))

unit.options <- c("Celsius", "Fahrenheit")
    
# Define UI for application that draws a histogram
ui <- fluidPage(theme = shinytheme("superhero"),

    # Application title
    titlePanel("Worldwide Temperature Visualization"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            fluidRow(
                selectInput(
                    "cities.selected",
                    "Choose at least one city",
                    city.options,
                    selected = c("Tokyo, Japan",
                                 "Oslo, Norway",
                                 "New York City, New York",
                                 "Delhi, India",
                                 "Canberra, Australia",
                                 "San Francisco, California"),
                    multiple = TRUE,
                    selectize = TRUE
                )
            ),
            fluidRow(
                selectInput(
                    "years.selected",
                    "Choose at least one year",
                    year.options,
                    selected = c("2020",
                                 "2015",
                                 "2010",
                                 "2005",
                                 "2000",
                                 "1995"),
                    multiple = TRUE,
                    selectize = TRUE
                )
            ),
            fluidRow(
                selectInput(
                    "unit.selected",
                    "Choose a temperature scale",
                    unit.options,
                    selected = "Celsius",
                    multiple = FALSE,
                    selectize = FALSE
                )
            ),
            br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),
            "Data source : ", tags$a(href="https://academic.udayton.edu/kissock/http/Weather/", "University of Dayton - Temperature Archive"),".",
            br(),br(),
            "To report bugs, please open an issue at ", tags$a(href="https://github.com/stevin-wilson/worldwide_temperature_visualization/issues", "Worldwide Temperature Visualization@Github")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Plot", plotOutput("temperature.vs.city.plot",
                                                    width = "auto",
                                                    height = "900px")),
                        tabPanel("Table", dataTableOutput("temperature.vs.city.table"))
            )
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    base.df <- reactive({
        readRDS("Data/weather_dataset_allCities.rds")
    })
    select.cities.years.df <- reactive({
        base.df() %>%
            filter(state_city %in% input$cities.selected) %>%
            filter(year %in% input$years.selected)
    })
    
    output$temperature.vs.city.table <- renderDataTable({
        if (input$unit.selected == "Celsius"){
            select.cities.years.df() %>%
                select(-c(mean_temperature_in_fahrenheit, num_observations)) %>%
                mutate(month = month.abb[month],
                       mean_temperature_in_celsius = round(mean_temperature_in_celsius,2)) %>%
                pivot_wider(names_from = state_city, 
                            values_from = mean_temperature_in_celsius)
        } else if (input$unit.selected == "Fahrenheit"){
            select.cities.years.df() %>%
                select(-c(mean_temperature_in_celsius, num_observations)) %>%
                mutate(month = month.abb[month],
                       mean_temperature_in_fahrenheit = round(mean_temperature_in_fahrenheit,2)) %>%
                pivot_wider(names_from = state_city, 
                            values_from = mean_temperature_in_fahrenheit)
        }   
    })
    

    output$temperature.vs.city.plot <- renderPlot({
        if (input$unit.selected == "Fahrenheit") {
            ggplot_weather <- select.cities.years.df() %>% 
                mutate(date = paste(year, month, "15" , sep = "-")) %>%
                mutate(date = ymd(date)) %>%
                ggplot( aes(month(date, label=TRUE, abbr=TRUE), 
                                                         mean_temperature_in_fahrenheit, group=year(date), colour=year(date))) +
                labs(x="Month", colour="Year", y = "Average temperature (in Fahrenheit)") +
                scale_y_continuous(breaks=seq(-200,200,10))
        } else if (input$unit.selected == "Celsius") {
            ggplot_weather <- select.cities.years.df() %>%
                mutate(date = paste(year, month, "15" , sep = "-")) %>%
                mutate(date = ymd(date)) %>%
                ggplot( aes(month(date, label=TRUE, abbr=TRUE), 
                                                         mean_temperature_in_celsius, group=year(date), colour=year(date))) +
                labs(x="Month", colour="Year", y = "Average temperature (in Celsius)") +
                scale_y_continuous(breaks=seq(-200,200,5))
        }
        ggplot_weather + geom_point() +
            geom_line(alpha = 0.8) +
            facet_wrap(~ state_city) +
            theme_dark()+
            theme(strip.background =element_rect(fill="black"),
                  strip.text = element_text(size = rel(2), colour = "white"),
                  axis.text.x = element_text(size = 14),
                  axis.text.y = element_text(size = 12),
                  plot.background = element_rect(fill = "aliceblue"),
                  legend.background = element_rect(fill="aliceblue",
                                                   size=0.5, linetype="solid", 
                                                   colour ="black"))+
            scale_color_viridis()
            })
}

# Run the application 
shinyApp(ui = ui, server = server)
