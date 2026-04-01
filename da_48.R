# Step 1: Install and load leaflet
install.packages("leaflet")
library(leaflet)

# Coordinates for Katpadi
lat <- 12.9692
lng <- 79.1559

# Step 2: Initialize map and set view
map <- leaflet() %>%
  addTiles() %>%
  setView(lng = lng, lat = lat, zoom = 13)

# Display base map
map

# Step 3: Add marker with popup
map <- map %>%
  addMarkers(lng = lng, lat = lat,
             popup = "Katpadi Region")

# Display map with marker
map

# Step 4: Add customized circle marker
map <- map %>%
  addCircleMarkers(lng = lng, lat = lat,
                   color = "red",
                   radius = 10,
                   label = "Katpadi Area")

# Display final map
map