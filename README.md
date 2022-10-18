# Spotify-Music-Analysis
Used Spotify API to analyze some of my favorite artists and the musical elements that their music contains.

This code is run using R. I created an account with spotify in order to access their API. 
Then using the language of the API I was able to pull data from my favorite artists.

Using this template:

"Artists Name" %>% 
  arrange(-valence) %>% 
  select(track_name, valence) %>% 
  head(5) %>% 
  kable()
  
 We are able to get any artist and their songs ranked from happiest to most sad.
 
 The purpose of the program is to see how spotify indentifes and creates custom playlists that are based
 on mood or similar type of music.
 
 I used code from https://www.rcharlie.com/blog/fitter-happier/.
