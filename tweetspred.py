# -*- coding: utf-8 -*-
"""TweetsPred.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1Ptv_n1KfeMlB_BjsJzrWPax_zeCi9Bem
"""

# import the pandas library to read the dataset
import pandas as pd
import pickle

# importing libraries and packages
import snscrape.modules.twitter as sntwitter
import pandas

# Creating list to append tweet data 
tweets_list1 = []

# Using TwitterSearchScraper to scrape data and append tweets to list
for i,tweet in enumerate(sntwitter.TwitterSearchScraper('EURO2020Final OR EuroFinal OR ENGITA + since:2021-07-11 until:2021-07-13').get_items()): #declare a username 
    if i>1000: #number of tweets you want to scrape
        break
    tweets_list1.append([tweet.date, tweet.id, tweet.content]) #declare the attributes to be returned
   
# Creating a dataframe from the tweets list above 
tweets_df1 = pd.DataFrame(tweets_list1, columns=['Datetime', 'Tweet Id', 'Text'])

tweets_df1.dropna(axis=0, inplace = True)

#read the data
# Extract the major parameters
x = tweets_df1["Text"]

import nltk

# import libraries to help with preprocessing
from nltk.corpus import stopwords
nltk.download('stopwords')
from nltk.stem import PorterStemmer

# This removes the stopwords in English Language
stop_words=stopwords.words('english')
stemmer=PorterStemmer()

# Next, we remove all special characters, single letters and convert them to lower case

import re
cleaned_data=[]  # a list to store all cleaned tweets
for i in range(len(x)):  # interates through every tweet
    
    tweet=re.sub('[^a-zA-Z]', ' ', x.iloc[i])  # removes all special characters
    tweet=re.sub(r'\s+[a-zA-Z]\s+', ' ', tweet)  # removes all single letters 
    tweet=tweet.lower().split()  # turns all text to lower case
    
    tweet=[stemmer.stem(word) for word in tweet if (word not in stop_words)]  # removes all stop words
    tweet=' '.join(tweet)  # joins the words to make a sentence
    cleaned_data.append(tweet) # appends all individual sentences to form a list 



'''The Count Vectorizer function converts a list of words into bag of words
max_features is set to 3000 which means, only 3000 of the most occurring words are used to create a bag of words
stop_words is used to remove words that frequently appear in the dataset which have no sentiment'''

from sklearn.feature_extraction.text import CountVectorizer
cv = CountVectorizer(max_features=200, stop_words=["https", "euro", "final", "england"])
bag_of_words = cv.fit_transform(cleaned_data).toarray()

#import model
# load the model from disk
model = pickle.load(open("result/finalized_model.pkl", 'rb'))

y_pred = model.predict(bag_of_words)

tweets_df1["Sentiment"] = y_pred

#save file with datename
#from datetime import datetime
#date = datetime.now().strftime("%Y_%m_%d-%I:%M:%S_%p")

#write to csv
tweets_df1.to_csv("result/data.csv", mode = 'a', index = False)
