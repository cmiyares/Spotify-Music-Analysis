install.packages('spotifyr')
library(spotifyr)
library(tidyverse)
library(knitr)
install.packages("magrittr") 
install.packages("dplyr")    
library(magrittr) 
library(dplyr)    
install.packages('knitr')
install.packages('ggjoy')
library(ggjoy)
library(ggplot2)
#pulling in acess token

Sys.setenv(SPOTIFY_CLIENT_ID = '')
Sys.setenv(SPOTIFY_CLIENT_SECRET = '')

access_token = get_spotify_access_token()

#-----------------------------------
# What are the keys that artists play in


#what is radioheads favorite key

radiohead = get_artist_audio_features('radiohead')

radiohead%>%
    count(key_mode, sort = TRUE)%>%
    head(5)%>%
    kable()

# 28 Radiohead songs are in G Major

#Other Artists

Magdalena = get_artist_audio_features('magdalena bay')
weyesBlood = get_artist_audio_features('weyes blood')
blackMidi = get_artist_audio_features('black midi')

# Magdalena bay Keys
Magdalena%>%
  count(key_mode, sort = TRUE)%>%
  head(5)%>%
  kable()

# Weyes Blood Keys
weyesBlood%>%
  count(key_mode, sort = TRUE)%>%
  head(5)%>%
  kable()

#Black Midi Keys
blackMidi%>%
  count(key_mode, sort = TRUE)%>%
  head(5)%>%
  kable()


#------------------------------------------
# What is the Valence or the happiness of the songs by Artist
# the higher the valence the happier the music sounds

radiohead %>% 
  arrange(-valence) %>% 
  select(track_name, valence) %>% 
  head(5) %>% 
  kable()

# Radioheads most happy song has a .846 with 1 being happiest

Magdalena %>% 
  arrange(-valence) %>% 
  select(track_name, valence) %>% 
  head(20) %>% 
  kable()

#weyes blood is music for sad people
weyesBlood %>% 
  arrange(-valence) %>% 
  select(track_name, valence) %>% 
  head(20) %>%
  kable()

#black midi
blackMidi %>% 
  arrange(-valence) %>% 
  select(track_name, valence) %>% 
  head(20) %>% 
  kable()

#--------------------------------------
#Plotting albums by sadness by song compared to other albums by the same artist

ggplot(radiohead, aes(x = valence, y = album_name)) + 
  geom_joy() + 
  theme_joy() +
  ggtitle("Joyplot of Radioheads joy distributions", subtitle = "Based on valence pulled from Spotify's Web API")


ggplot(Magdalena, aes(x = valence, y = album_name)) + 
  geom_joy() + 
  theme_joy() +
  ggtitle("Joyplot of Magdalena Bay joy distributions", subtitle = "Based on valence pulled from Spotify's Web API")


ggplot(weyesBlood, aes(x = valence, y = album_name)) + 
  geom_joy() + 
  theme_joy() +
  ggtitle("Joyplot of Weyes Blood's joy distributions", subtitle = "Based on valence pulled from Spotify's Web API")



ggplot(blackMidi, aes(x = valence, y = album_name)) + 
  geom_joy() + 
  theme_joy() +
  ggtitle("Joyplot of Black Midi's joy distributions", subtitle = "Based on valence pulled from Spotify's Web API")





