## ---- eval=FALSE---------------------------------------------------------
#  install.packages("lingtypology")

## ---- eval= F------------------------------------------------------------
#  install.packages("devtools")
#  devtools::install_github("agricolamz/lingtypology")

## ------------------------------------------------------------------------
library(lingtypology)

## ------------------------------------------------------------------------
iso.lang("Adyghe")
lang.iso("ady")
country.lang("Adyghe")
lang.aff("Abkhaz-Adyge")

## ------------------------------------------------------------------------
area.lang(c("Adyghe", "Aduge"))
lang <- c("Adyghe", "Russian")
aff.lang(lang)

## ------------------------------------------------------------------------
iso.lang(lang.aff("East Slavic"))

## ------------------------------------------------------------------------
country.lang(c("Udi", "Laz"))
country.lang(c("Udi", "Laz"), intersection = TRUE)

## ------------------------------------------------------------------------
lang.country("Cape Verde")
lang.country("Cabo Verde")
head(lang.country("UK"))

## ------------------------------------------------------------------------
aff.lang("Adyge")

## ------------------------------------------------------------------------
is.glottolog(c("Tabasaran", "Tabassaran"), glottolog.source = "original")

## ------------------------------------------------------------------------
is.glottolog(c("Tabasaran", "Tabassaran"), glottolog.source = "modified")

## ------------------------------------------------------------------------
is.glottolog(c("Tabasaran", "Tabassaran"), g = "o")

## ------------------------------------------------------------------------
is.glottolog(c("Tabasaran", "Tabassaran"), g = "m")

## ---- fig.width=6.2------------------------------------------------------
map.feature(c("Adyghe", "Kabardian", "Polish", "Russian", "Bulgarian"))

## ---- eval = FALSE-------------------------------------------------------
#  m <- map.feature(c("Adyghe", "Korean"))
#  # install.packages("htmlwidgets")
#  library(htmlwidgets)
#  saveWidget(m, file="/home/agricolamz/_DATA/OneDrive1/_Work/github/lingtypology/m.html")

## ------------------------------------------------------------------------
df <- data.frame(language = c("Adyghe", "Kabardian", "Polish", "Russian", "Bulgarian"),
                 features = c("polysynthetic", "polysynthetic", "fusional", "fusional", "fusional"))
df

## ---- fig.width=6.2------------------------------------------------------
map.feature(languages = df$language, features = df$features)

## ---- fig.width=6.2------------------------------------------------------
df$features <- factor(df$features, levels = c("polysynthetic", "fusional"))
map.feature(languages = df$language, features = df$features)

## ---- fig.width=6.2------------------------------------------------------
set.seed(42)
map.feature(languages = df$language, features = df$features)

## ---- fig.width=6.2------------------------------------------------------
set.seed(42)
map.feature(df$language, df$features)

## ---- fig.width=6.2------------------------------------------------------
df$popup <- aff.lang(df$language)

## ---- fig.width=6.2------------------------------------------------------
set.seed(42)
map.feature(languages = df$language, features = df$features, popup = df$popup)

## ---- fig.width=6.2------------------------------------------------------
set.seed(42)
map.feature(df$language, df$features, df$popup)

## ---- fig.width=6.2------------------------------------------------------
# change a df$popup vector
df$popup <- c ("sɐ s-ɐ-k'ʷɐ<br> 1sg 1sg.abs-dyn-go<br>'I go'",
               "sɐ s-o-k'ʷɐ<br> 1sg 1sg.abs-dyn-go<br>'I go'",
               "id-ę<br> go-1sg.npst<br> 'I go'",
               "ya id-u<br> 1sg go-1sg.npst <br> 'I go'",
               "id-a<br> go-1sg.prs<br> 'I go'")
# create a map
set.seed(42)
map.feature(df$language, df$features, df$popup)

## ---- fig.width=6.2------------------------------------------------------
# Lets create a dataframe with links to video
sign_df <- data.frame(languages = c("American Sign Language", "Russian Sign Language", "French Sign Language"),
                 popup = c("https://media.spreadthesign.com/video/mp4/13/48600.mp4", "https://media.spreadthesign.com/video/mp4/12/17639.mp4", "https://media.spreadthesign.com/video/mp4/10/17638.mp4"))

# Change popup to an HTML code
sign_df$popup <- paste("<video width='200' height='150' controls> <source src='",
                  as.character(sign_df$popup),
                  "' type='video/mp4'></video>", sep = "")

# create a map
map.feature(languages = sign_df$languages, popup = sign_df$popup)

## ---- fig.width=6.2------------------------------------------------------
set.seed(42)
map.feature(df$language, df$features,
            label = df$language)

## ---- fig.width=6.2------------------------------------------------------
set.seed(42)
map.feature(df$language, df$features,
            label = df$language,
            label.fsize = 20,
            label.position = "left",
            label.hide = TRUE)

## ---- fig.width=6.2------------------------------------------------------
set.seed(42)
map.feature(languages = circassian$language,
            features = circassian$languoid,
            popup = circassian$village,
            latitude = circassian$latitude,
            longitude = circassian$longitude)

## ---- fig.width=6.2------------------------------------------------------
df <- data.frame(language = c("Adyghe", "Kabardian", "Polish", "Russian", "Bulgarian"),
                 features = c("polysynthetic", "polysynthetic", "fusional", "fusional", "fusional"))
map.feature(languages = df$language,
            features = df$features,
            color = c("yellowgreen", "navy"))

## ---- fig.width=6.2------------------------------------------------------
set.seed(42)
map.feature(languages = df$language,
            features = df$features,
            control = TRUE)

## ---- fig.width=6.2------------------------------------------------------
set.seed(42)
map.feature(circassian$language,
            features = circassian$languoid,
            stroke.features = circassian$language,
            latitude = circassian$latitude,
            longitude = circassian$longitude)

## ---- message= F, fig.width=6.2------------------------------------------
# create newfeature variable
newfeature <- circassian[,c(5,6)]
# set language feature of the Baksan villages to NA and reduce newfeature from dataframe to vector
newfeature <-  replace(newfeature$language, newfeature$languoid == "Baksan", NA)
# create a map
set.seed(42)
map.feature(circassian$language,
            features = circassian$languoid,
            latitude = circassian$latitude,
            longitude = circassian$longitude,
            stroke.features = newfeature)

## ---- fig.width=6.2------------------------------------------------------
set.seed(42)
map.feature(circassian$language,
            features = circassian$languoid,
            stroke.features = circassian$language,
            latitude = circassian$latitude,
            longitude = circassian$longitude,
            radius = 7, stroke.radius = 13)

set.seed(42)
map.feature(circassian$language,
            features = circassian$languoid,
            stroke.features = circassian$language,
            latitude = circassian$latitude,
            longitude = circassian$longitude,
            opacity = 0.7, stroke.opacity = 0.6)

## ---- fig.width=6.2------------------------------------------------------
set.seed(42)
map.feature(circassian$language,
            features = circassian$languoid,
            stroke.features = circassian$language,
            latitude = circassian$latitude,
            longitude = circassian$longitude,
            legend = FALSE, stroke.legend = TRUE)

set.seed(42)
map.feature(circassian$language,
            features = circassian$languoid,
            stroke.features = circassian$language,
            latitude = circassian$latitude,
            longitude = circassian$longitude,
            title = "Circassian dialects", stroke.title = "Languages")

## ---- fig.width=6.2------------------------------------------------------
set.seed(42)
map.feature(c("Adyghe", "Polish", "Kabardian", "Russian"),
            scale.bar = TRUE,
            scale.bar.position = "topright")

## ---- fig.width=6.2------------------------------------------------------
df <- data.frame(lang = c("Adyghe", "Kabardian", "Polish", "Russian", "Bulgarian"),
   feature = c("polysynthetic", "polysynthetic", "fusion", "fusion", "fusion"),
   popup = c("Adyghe", "Adyghe", "Slavic", "Slavic", "Slavic"))
set.seed(42)
map.feature(df$lang, df$feature, df$popup,
            tile = "Thunderforest.OpenCycleMap")

## ---- fig.width=6.2------------------------------------------------------
df <- data.frame(lang = c("Adyghe", "Kabardian", "Polish", "Russian", "Bulgarian"),
   feature = c("polysynthetic", "polysynthetic", "fusion", "fusion", "fusion"),
   popup = c("Adyghe", "Adyghe", "Slavic", "Slavic", "Slavic"))
set.seed(42)
map.feature(df$lang, df$feature, df$popup,
            tile = c("OpenStreetMap.BlackAndWhite", "Thunderforest.OpenCycleMap"))

## ---- fig.width=6.2------------------------------------------------------
df <- data.frame(lang = c("Adyghe", "Kabardian", "Polish", "Russian", "Bulgarian"),
   feature = c("polysynthetic", "polysynthetic", "fusion", "fusion", "fusion"),
   popup = c("Adyghe", "Adyghe", "Slavic", "Slavic", "Slavic"))
set.seed(42)
map.feature(df$lang, df$feature, df$popup,
            tile = c("OpenStreetMap.BlackAndWhite", "Thunderforest.OpenCycleMap"),
            tile.name = c("b & w", "colored"))

## ---- fig.width=6.2------------------------------------------------------
df <- data.frame(lang = c("Adyghe", "Kabardian", "Polish", "Russian", "Bulgarian"),
   feature = c("polysynthetic", "polysynthetic", "fusion", "fusion", "fusion"),
   popup = c("Adyghe", "Adyghe", "Slavic", "Slavic", "Slavic"))
set.seed(42)
map.feature(df$lang, df$feature, df$popup,
            tile = c("OpenStreetMap.BlackAndWhite", "Thunderforest.OpenCycleMap"),
            control = TRUE)

## ---- fig.width=6.2------------------------------------------------------
set.seed(42)
map.feature(c("Adyghe", "Polish", "Kabardian", "Russian"),
            minimap = TRUE)

## ---- fig.width=6.2------------------------------------------------------
set.seed(42)
map.feature(c("Adyghe", "Polish", "Kabardian", "Russian"),
            minimap = TRUE,
            minimap.position = "topright",
            minimap.height = 100,
            minimap.width = 100)

## ---- fig.width=6.2------------------------------------------------------
df <- data.frame(lang = c("Russian", "Russian"),
                 lat  = c(55.75, 59.95),
                 long = c(37.616667, 30.3),
# I use here URL shortener by Google
                 urls = c("https://goo.gl/5OUv1E",
                          "https://goo.gl/UWmvDw"))
map.feature(languages = df$lang,
            latitude = df$lat,
            longitude = df$long,
            image.url = df$urls)

## ---- fig.width=6.2------------------------------------------------------
df <- data.frame(lang = c("Russian", "Russian"),
                 lat  = c(55.75, 59.95),
                 long = c(37.616667, 30.3),
# I use here URL shorter by Google
                 urls = c("https://goo.gl/5OUv1E",
                          "https://goo.gl/UWmvDw"))
map.feature(languages = df$lang,
            latitude = df$lat,
            longitude = df$long,
            image.url = df$urls,
            image.width = 200,
            image.height = 200)

## ---- fig.width=6.2------------------------------------------------------
df <- data.frame(lang = c("Russian", "Russian"),
                 lat  = c(55.75, 59.95),
                 long = c(37.616667, 30.3),
# I use here URL shorter by Google
                 urls = c("https://goo.gl/5OUv1E",
                          "https://goo.gl/UWmvDw"))
map.feature(languages = df$lang,
            latitude = df$lat,
            longitude = df$long,
            image.url = df$urls,
            image.width = 150,
            image.height = 150,
            image.X.shift = 10,
            image.Y.shift = 0)

## ------------------------------------------------------------------------
new_data <- read.csv("https://goo.gl/GgscBE")
tail(new_data)

## ---- fig.width=6.2, message= FALSE--------------------------------------
library(dplyr)
new_data %>%
  mutate(Language.name = gsub(pattern = " ", replacement = "", Language.name)) %>% 
  filter(is.glottolog(Language.name) == TRUE) %>% 
  filter(area.lang(Language.name) == "Africa") %>% 
  select(Language.name) %>% 
  map.feature()

## ---- fig.width=6.2, message= FALSE--------------------------------------
library(dplyr)
new_data %>%
  mutate(Language.name = gsub(pattern = " ", replacement = "", Language.name)) %>% 
  filter(is.glottolog(Language.name) == TRUE) %>% 
  filter(area.lang(Language.name) == "Africa") %>% 
  select(Language.name) %>% 
  map.feature(., minimap = TRUE)

## ------------------------------------------------------------------------
citation("lingtypology")

