#!/bin/bash

echo "Setting up local Dynamo DB - docker container"
docker-compose up -d
echo "Done."

DYNAMODB_ENDPOINT="http://localhost:9001"
NEW_YEAR_RESOLUTIONS="new-year-resolutions"

create_new_year_resolution_table() {
  echo "table delete: aws dynamodb delete-table --endpoint-url  $DYNAMODB_ENDPOINT --table-name $NEW_YEAR_RESOLUTIONS --output yaml --no-cli-pager"

  echo "creating table definition: ${NEW_YEAR_RESOLUTIONS}"

  aws dynamodb create-table --endpoint-url $DYNAMODB_ENDPOINT --table-name $NEW_YEAR_RESOLUTIONS --no-cli-pager \
    --attribute-definitions \
    AttributeName=tweet_id,AttributeType=S \
    AttributeName=gender,AttributeType=S \
    --key-schema \
    AttributeName=tweet_id,KeyType=HASH \
    --provisioned-throughput \
    ReadCapacityUnits=10,WriteCapacityUnits=5 \
    --global-secondary-indexes \
    "[
      {
        \"IndexName\":\"gsi_gender\",
        \"KeySchema\":[{\"AttributeName\":\"gender\",\"KeyType\":\"HASH\"}],
        \"Projection\":{\"ProjectionType\":\"ALL\"},
        \"ProvisionedThroughput\":{\"ReadCapacityUnits\":10,\"WriteCapacityUnits\":5}
      }
    ]"

  aws dynamodb describe-table --endpoint-url $DYNAMODB_ENDPOINT --table $NEW_YEAR_RESOLUTIONS --output yaml --no-cli-pager
}

populate_new_year_resolution_table() {
  echo "Loading data..."
  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "1"},
"tweet_text": { "S": "#NewYearsResolution :: Read more books, No scrolling FB/checking email b4 breakfast, stay dedicated to PT/yoga to squash my achin back!"},
"name": {"S": "Dena_Marina"},
"gender": {"S": "female"},
"resolution_category": {"S": "Health & Fitness"},
"retweet_count": {"S": "0"},
"location": {"S": "Southern California"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "2"},
"tweet_text": { "S": "#NewYearsResolution Finally master @ZJ10 s part of Kitchen Sink"},
"name": {"S": "ninjagirl325"},
"gender": {"S": "female"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "1"},
"location": {"S": "New Jersey"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "3"},
"tweet_text": { "S": "#NewYearsResolution to stop being so damn perf _ÙÕÐ_ÙÕÉ"},
"name": {"S": "RickyDelReyy"},
"gender": {"S": "male"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "Hollywood"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "4"},
"tweet_text": { "S": "My #NewYearsResolution is to help my disabled patients discover the emotional and physical therapy from loving a pet. #adoptarescue"},
"name": {"S": "CalmareNJ"},
"gender": {"S": "male"},
"resolution_category": {"S": "Philanthropic"},
"retweet_count": {"S": "0"},
"location": {"S": "Metro NYC"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "5"},
"tweet_text": { "S": "#NewYearsResolution #2015Goals #2015bucketlist continued‰_•ü http://t.co/h4P9B7tWjG"},
"name": {"S": "welovatoyoudemi"},
"gender": {"S": "female"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "Pittsburgh, Pennsylvania "}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "6"},
"tweet_text": { "S": "#NewYearsResolution 1. Eat less. 2.quit lying."},
"name": {"S": "EthanJMoroles"},
"gender": {"S": "male"},
"resolution_category": {"S": "Health & Fitness"},
"retweet_count": {"S": "0"},
"location": {"S": "Odessa Texas. "}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "8"},
"tweet_text": { "S": "‰ÛÏ@Becca3129 #NewYearsResolution #ForReal #TheStruggle http://t.co/y1kABoWMbV‰Ûdamn..this is so true."},
"name": {"S": "freckleface_kev"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "North Carolina"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "9"},
"tweet_text": { "S": "Save a pit bulls life #NewYearsResolution"},
"name": {"S": "yourethe1zforme"},
"gender": {"S": "male"},
"resolution_category": {"S": "Philanthropic"},
"retweet_count": {"S": "0"},
"location": {"S": "North Carolina"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "10"},
"tweet_text": { "S": "RT @_Dear_Leader_: #NewYearsResolution - I will get a decent haircut."},
"name": {"S": "Dandridge9"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "3"},
"location": {"S": "Portland, Oregon USA"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "11"},
"tweet_text": { "S": "lost a lot this year...no more tears for the next. #NewYearsResolution"},
"name": {"S": "Reesesking1"},
"gender": {"S": "male"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "San Antonio, Texas"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "12"},
"tweet_text": { "S": "#ToDoList ‰ÛÏ@blogbooktours: This is you all over the place,  #actors #acting #NewYearsResolution #success @theiflist http://t.co/CIaz7FB0fq‰Û"},
"name": {"S": "welcometoboz"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "Los Angeles, CA"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "13"},
"tweet_text": { "S": "RT @colonsuzan: Easy #NewYearsResolution: Stand up for your health with the @takeayogabreak app! http://t.co/WwL9JDvAhZ http://t.co/vpcfSqm‰Û_"},
"name": {"S": "scandalwomen"},
"gender": {"S": "female"},
"resolution_category": {"S": "Health & Fitness"},
"retweet_count": {"S": "1"},
"location": {"S": "New York"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "14"},
"tweet_text": { "S": "@Inc @MarlaTabaka YES - lets all take calculated risks and reduce self criticism as part of our #NewYearsResolution"},
"name": {"S": "vtorres0811"},
"gender": {"S": "female"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "New York, NY"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "15"},
"tweet_text": { "S": "I always torture myself by looking at old pictures where I was 30 lbs thinner. #NewYearsResolution"},
"name": {"S": "SydneyySayys"},
"gender": {"S": "female"},
"resolution_category": {"S": "Health & Fitness"},
"retweet_count": {"S": "0"},
"location": {"S": "Menasha, WI"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "16"},
"tweet_text": { "S": "treat people the way they treat me! _ÙÕø‰ÏÎ•ü#NewYearsResolution"},
"name": {"S": "DGP_Omen"},
"gender": {"S": "male"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "Muck City, Florida"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "17"},
"tweet_text": { "S": "#NewYearsResolution Stop worrying about irrelevant things"},
"name": {"S": "AshleeSoAfrican"},
"gender": {"S": "female"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "Houston, Tx"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "18"},
"tweet_text": { "S": "#NewYearsResolution to start a hobby, do it once, and never do it again."},
"name": {"S": "yates_amber"},
"gender": {"S": "female"},
"resolution_category": {"S": "Recreation & Leisure"},
"retweet_count": {"S": "0"},
"location": {"S": "louisville, ky"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "19"},
"tweet_text": { "S": "#NewYearsResolution Watch Die Hard twice a day, instead of just once."},
"name": {"S": "Steven_Baucom"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "Clarksville, TN"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "20"},
"tweet_text": { "S": "Time to give up tobacco! #NewYearsResolution"},
"name": {"S": "chadzizelman"},
"gender": {"S": "male"},
"resolution_category": {"S": "Health & Fitness"},
"retweet_count": {"S": "0"},
"location": {"S": "Cincinnati, OH"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "21"},
"tweet_text": { "S": "Theme 2015 is about trusting justice, peace and love. Bonding with everything from all directions, all forces. #karma #NewYearsResolution"},
"name": {"S": "superqguru"},
"gender": {"S": "male"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "Rock Creek Oregon"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "22"},
"tweet_text": { "S": "RT @kymeshawhite: #NewYearsResolution To grow in christ and increase spiritually next year."},
"name": {"S": "JustMeShauntell"},
"gender": {"S": "female"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "1"},
"location": {"S": "Atlanta,GA"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "23"},
"tweet_text": { "S": "I was going to resolve to procrastinate less, but honestly whats the rush? #NewYearsResolution"},
"name": {"S": "tyson_c"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "Chico, CA"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "24"},
"tweet_text": { "S": "RT @JessicaDrown: My #NewYearsResolution is to grow and continue to make you guys smile. ‰÷¼•ü_ÙÕ¥"},
"name": {"S": "metalheadjs"},
"gender": {"S": "male"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "4"},
"location": {"S": "San Antonio Tx"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "25"},
"tweet_text": { "S": "#NewYearsResolution - I will cut a bitch in the face if I ever hear The Spin Doctors \"Two Princes\" again!"},
"name": {"S": "BlueFirecracker"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "Los Angeles, CA"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "26"},
"tweet_text": { "S": "#NewYearsResolution Go to more shows where \"you will get wet\" is warned before hand."},
"name": {"S": "Steven_Baucom"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "Clarksville, TN"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "27"},
"tweet_text": { "S": "#NewYearsResolution Stop watching morning national news"},
"name": {"S": "DITUPAC3361"},
"gender": {"S": "male"},
"resolution_category": {"S": "Recreation & Leisure"},
"retweet_count": {"S": "0"},
"location": {"S": "Long Beach"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "28"},
"tweet_text": { "S": "Also, date women my own age. Not to say its their fault, only a seasoned woman can put up with my idiocy. #NewYearsResolution"},
"name": {"S": "billrepko"},
"gender": {"S": "male"},
"resolution_category": {"S": "Family/Friends/Relationships"},
"retweet_count": {"S": "0"},
"location": {"S": "Kutztown"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "29"},
"tweet_text": { "S": "#NewYearsResolution 2: Avoid Game of Thrones spoilers. Which will be really hard cause Im on book 2 and seriously spoilers are EVERYWHERE"},
"name": {"S": "TaraBethIdaho"},
"gender": {"S": "female"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "Moscow, Idaho"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "30"},
"tweet_text": { "S": "#NewYearsResolution Stop being so nice to people"},
"name": {"S": "AshleeSoAfrican"},
"gender": {"S": "female"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "Houston, Tx"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "31"},
"tweet_text": { "S": "#NewYearsResolution be happy"},
"name": {"S": "ra_miller19"},
"gender": {"S": "female"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "Pennsylvania/ Massachusetts"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "32"},
"tweet_text": { "S": "#NewYearsResolution Transfer to another College"},
"name": {"S": "AshleeSoAfrican"},
"gender": {"S": "female"},
"resolution_category": {"S": "Career"},
"retweet_count": {"S": "0"},
"location": {"S": "Houston, Tx"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "33"},
"tweet_text": { "S": "#Newyearsresolution get a #classic #americanmusclecar #pontiacfirebird #400v8 numbers matching 1969‰Û_ http://t.co/tI4ELI7xrT"},
"name": {"S": "Tommy4cars"},
"gender": {"S": "male"},
"resolution_category": {"S": "Recreation & Leisure"},
"retweet_count": {"S": "0"},
"location": {"S": "Chester Springs,PA"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "34"},
"tweet_text": { "S": "In 2015 I hope my years &amp; my New Years resolution. Make it the best memorable moment to be amazing #NewYearsResolution #NewYear"},
"name": {"S": "GavinoBernal"},
"gender": {"S": "male"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "North Las Vegas, Nevada"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "35"},
"tweet_text": { "S": "My #NewYearsResolution Is To Stay Positive_ÙÔÎ_ÙÔÎ_ÙÔÎ"},
"name": {"S": "YungBerna"},
"gender": {"S": "male"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "13"},
"location": {"S": "Chicago"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "36"},
"tweet_text": { "S": "RT @RuStretch: #NewYearsResolution stop smoking _ÙªÉ‰Ý_•ü"},
"name": {"S": "901patt"},
"gender": {"S": "male"},
"resolution_category": {"S": "Health & Fitness"},
"retweet_count": {"S": "1"},
"location": {"S": "19|Tennessee State University"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "37"},
"tweet_text": { "S": "#NewYearsResolution Get more stuff off craigslist."},
"name": {"S": "Steven_Baucom"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "Clarksville, TN"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "38"},
"tweet_text": { "S": "RT @Tquadah: Some of yall  waiting for a new year for change when I been working on change. #NewYearsEve #NewYearsResolution"},
"name": {"S": "HolUpMan"},
"gender": {"S": "male"},
"resolution_category": {"S": "Health & Fitness"},
"retweet_count": {"S": "1"},
"location": {"S": "SNB‰Ïö Lamar University"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "39"},
"tweet_text": { "S": "#NewYearsResolution stop drinking smoking all that. So Im getting fucked up before 12oclock hit"},
"name": {"S": "jaaron_a"},
"gender": {"S": "male"},
"resolution_category": {"S": "Health & Fitness"},
"retweet_count": {"S": "0"},
"location": {"S": "fremont"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "40"},
"tweet_text": { "S": "RT @Ruebi_LHB: #wwwblogs: My #NewYearsResolution is to stop being such a miserable shit....Pffft, yeah right! http://t.co/9wBEVjTtGs ...#hu‰Û_"},
"name": {"S": "LoriLSchafer"},
"gender": {"S": "female"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "4"},
"location": {"S": "Northern California, USA"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "41"},
"tweet_text": { "S": "I want 2015 2 lack entropy, become pregnant w/empathy, &amp; put me on the super highway 2 fulfillment! #NewYearsResolution #StopTalkinStartDoin"},
"name": {"S": "LadyLiberally"},
"gender": {"S": "female"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "Marquette, Mi"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "42"},
"tweet_text": { "S": "My #NewYearsResolution is twofold: eat more #chipotle and be at Wrigley when the @Cubs win the #worldseries this year!"},
"name": {"S": "typaluska"},
"gender": {"S": "male"},
"resolution_category": {"S": "Health & Fitness"},
"retweet_count": {"S": "0"},
"location": {"S": "Peoria, IL"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "43"},
"tweet_text": { "S": "Happy #NewYearsEve . whats your guys #NewYearsResolution ? Mine is to prove you can do good #cosplay #cheep and start getting more \"social\""},
"name": {"S": "Ashesfall_"},
"gender": {"S": "female"},
"resolution_category": {"S": "Family/Friends/Relationships"},
"retweet_count": {"S": "0"},
"location": {"S": "Spokane Washington. USA"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "44"},
"tweet_text": { "S": "#NewYearsResolution is to go to the gym regularly but Im gonna wait a week or two for the other billion or so with the same one to give up."},
"name": {"S": "apechacek88"},
"gender": {"S": "male"},
"resolution_category": {"S": "Health & Fitness"},
"retweet_count": {"S": "0"},
"location": {"S": "Massachusetts"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "45"},
"tweet_text": { "S": "This is how I‰Ûªm living a connected life in 2015. #NewYearsResolution http://t.co/WnUFDBB7gy #ATTCrowd #ad"},
"name": {"S": "gamemonkeyvt"},
"gender": {"S": "male"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "Barton, VT"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "46"},
"tweet_text": { "S": "MMT @neilwatkins05 @elledodd: \"Im setting myself 10, or at most 12, goals for 2015.\" Yes but with 159 #indicators! #NewYearsResolution #SDG"},
"name": {"S": "sbleggi"},
"gender": {"S": "male"},
"resolution_category": {"S": "Career"},
"retweet_count": {"S": "0"},
"location": {"S": "MoCo, MD & SW DC"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "47"},
"tweet_text": { "S": "This will be MY year. #NewYearsResolution #2015 http://t.co/2w3YK3cty5"},
"name": {"S": "abstractwriter"},
"gender": {"S": "female"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "Chicago"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "48"},
"tweet_text": { "S": "#NewYearsResolution get closer to the man above _ÙªÎ_Ùª"},
"name": {"S": "m_cash2"},
"gender": {"S": "male"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "houston, tx"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "49"},
"tweet_text": { "S": "RT @Queen_of_prep: Im gonna get rich and be a bitch #NewYearsResolution"},
"name": {"S": "emily_mariem33"},
"gender": {"S": "female"},
"resolution_category": {"S": "Finance"},
"retweet_count": {"S": "1"},
"location": {"S": "ky"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "50"},
"tweet_text": { "S": "#NewYearsResolution no.more.drunk.texting."},
"name": {"S": "BitchyPhotogrl"},
"gender": {"S": "female"},
"resolution_category": {"S": "Health & Fitness"},
"retweet_count": {"S": "0"},
"location": {"S": "Ohio, unfortunately. "}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "51"},
"tweet_text": { "S": "change peoples lives with Necco Wafers #NewYearsResolution"},
"name": {"S": "StopHaydenIsBad"},
"gender": {"S": "male"},
"resolution_category": {"S": "Philanthropic"},
"retweet_count": {"S": "0"},
"location": {"S": "Rochester"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "52"},
"tweet_text": { "S": "#NewYearsResolution To stop writing \"For sexual favors\" in the memo line of all my checks."},
"name": {"S": "PittsburghM1ke"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "Cumberland, MD"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "53"},
"tweet_text": { "S": "Gonna do this in 2015! #newyearsresolution http://t.co/t62lTpkKyL"},
"name": {"S": "kelliekennedyy"},
"gender": {"S": "female"},
"resolution_category": {"S": "Health & Fitness"},
"retweet_count": {"S": "0"},
"location": {"S": "North Carolina"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "54"},
"tweet_text": { "S": "Eat French fries for breakfast every day in 2015 #NewYearsResolution"},
"name": {"S": "paulywog"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "New York, NY"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "55"},
"tweet_text": { "S": "@ochocinco I will tweet you everyday until you notice me!!!!! #NewYearsResolution"},
"name": {"S": "SimplyRechanale"},
"gender": {"S": "female"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "Texas"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "56"},
"tweet_text": { "S": "My #NewYearsResolution is to call people back within 24 hours and make more effort with friends. Have to stop falling off the grid."},
"name": {"S": "DebbieRFischer"},
"gender": {"S": "female"},
"resolution_category": {"S": "Family/Friends/Relationships"},
"retweet_count": {"S": "0"},
"location": {"S": "Florida b/c I love weirdos. "}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "57"},
"tweet_text": { "S": "#NewYearsResolution - This year I want to really find myself. My psychic says Im probably buried underwater or in someone elses grave."},
"name": {"S": "YakiMargulies"},
"gender": {"S": "male"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "Los Angeles"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "58"},
"tweet_text": { "S": "#NewYearsResolution: Keep a blog of all the amazing #tacos I have."},
"name": {"S": "udp514"},
"gender": {"S": "male"},
"resolution_category": {"S": "Recreation & Leisure"},
"retweet_count": {"S": "0"},
"location": {"S": "Philadelphia, PA"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "59"},
"tweet_text": { "S": "I hope to meet more of my internet friends in 2015 #NewYearsResolution"},
"name": {"S": "swaggy_senator"},
"gender": {"S": "male"},
"resolution_category": {"S": "Family/Friends/Relationships"},
"retweet_count": {"S": "0"},
"location": {"S": "Jefferson City, MO"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "60"},
"tweet_text": { "S": "Drink beer besides Yuengling #NewYearsResolution"},
"name": {"S": "SaltySith"},
"gender": {"S": "female"},
"resolution_category": {"S": "Recreation & Leisure"},
"retweet_count": {"S": "0"},
"location": {"S": "Pittsburgh, PA"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "61"},
"tweet_text": { "S": "Bang a stripper #NewYearsResolution"},
"name": {"S": "paulywog"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "New York, NY"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "62"},
"tweet_text": { "S": "#NewYearsResolution is to start #writing again. I need to get my ass back into gear! #thestruggle"},
"name": {"S": "LivnDeadGrl87"},
"gender": {"S": "female"},
"resolution_category": {"S": "Career"},
"retweet_count": {"S": "0"},
"location": {"S": "Boston"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "63"},
"tweet_text": { "S": "Lets leave the words bae, bruh, thot, and fleek in 2014. #NewYearsResolution #stupidwordsof2014"},
"name": {"S": "ssl01191"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "Wichita Falls, TX"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "64"},
"tweet_text": { "S": "Burn as many bridges as possible (literally and figuratively) #NewYearsResolution"},
"name": {"S": "paulywog"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "New York, NY"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "65"},
"tweet_text": { "S": "#NewYearsResolution: tweet more about the @Indians because I know all of my Chicago and MPLS-based followers crave it. Youre welcome guys"},
"name": {"S": "YoungWilliam27"},
"gender": {"S": "male"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "Minneapolis via South Bend/CL"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "66"},
"tweet_text": { "S": "My #NewYearsResolution is that Im gonna start punching folks for saying dumb shit, which means my hands will be tired around 12:02am 2nite."},
"name": {"S": "TerrancePryor"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "North Jersey"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "67"},
"tweet_text": { "S": "In this new year I promise not to let it be like the last #newyearsresolution"},
"name": {"S": "Lilmeechie12"},
"gender": {"S": "male"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "Aurora (The City Of Lights)"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "68"},
"tweet_text": { "S": "#NewYearsResolution - Go to the gym more. And burn it to the ground."},
"name": {"S": "YakiMargulies"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "Los Angeles"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "69"},
"tweet_text": { "S": "This is my #NewYearsResolution http://t.co/3uvUfZJWCh"},
"name": {"S": "RKive612"},
"gender": {"S": "male"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "Minneapolis, Minnesota"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "70"},
"tweet_text": { "S": "RT @TSAgov: Talk less. Touch more. #TSA #NewYearsResolution"},
"name": {"S": "ctwillie"},
"gender": {"S": "male"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "11"},
"location": {"S": "Eastern NC"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "71"},
"tweet_text": { "S": "Having to poop after a shower &lt;&lt;&lt;&lt;.  I refuse to let this happen in 2015!! _Ù÷__Ù÷â #NewYearsResolution"},
"name": {"S": "bebegurljc"},
"gender": {"S": "female"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "NJ"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "72"},
"tweet_text": { "S": "#NewYearsResolution 3. Love better"},
"name": {"S": "NiMF245"},
"gender": {"S": "male"},
"resolution_category": {"S": "Family/Friends/Relationships"},
"retweet_count": {"S": "0"},
"location": {"S": "Chicago, Illinois"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "73"},
"tweet_text": { "S": "no more starbucks starting tomorrow... too much money spent on vanilla lattes and lots of jiggly parts to burn off :/ #NewYearsResolution"},
"name": {"S": "AvaYuen"},
"gender": {"S": "female"},
"resolution_category": {"S": "Finance"},
"retweet_count": {"S": "0"},
"location": {"S": "Washington D.C."}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "74"},
"tweet_text": { "S": "#NewYearsResolution 1. Be more competitive"},
"name": {"S": "NiMF245"},
"gender": {"S": "male"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "Chicago, Illinois"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "76"},
"tweet_text": { "S": "#NewYearsResolution: To not make a new years resolution. That is all."},
"name": {"S": "daleapproved"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "Colorado"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "78"},
"tweet_text": { "S": "Drink more #wine in 2015. #NewYearsResolution"},
"name": {"S": "AprilMonterrosa"},
"gender": {"S": "female"},
"resolution_category": {"S": "Health & Fitness"},
"retweet_count": {"S": "1"},
"location": {"S": "Deep in the Heart of Texas"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "79"},
"tweet_text": { "S": "My #NewYearsResolution is to hope harder &amp; more often that someone punches @NancyGraceHLN &amp; @Rachel__Nichols in the face. Go fuck yourselves"},
"name": {"S": "AboutTimeMario"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "Ft.Wayne Indiana"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "80"},
"tweet_text": { "S": "My resolution is to treat 2015 as 365 opportunities rather than a year! #newyearsresolution #newyears‰Û_ http://t.co/fkx051xrNh"},
"name": {"S": "ohhliviiia"},
"gender": {"S": "female"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "El Sobrante, CA"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "81"},
"tweet_text": { "S": "Ill care a little less next year! #NewYearsResolution  #2015"},
"name": {"S": "allaboutgingy"},
"gender": {"S": "female"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "Pacifica, CA"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "82"},
"tweet_text": { "S": "Im finally gonna write that fan fiction on Los Del Rio and capitalize on that Macarena craze. #NewYearsResolution"},
"name": {"S": "PhilBacharach"},
"gender": {"S": "male"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "Oklahoma City"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "83"},
"tweet_text": { "S": "For 2015, I resolve to not get sucked out into the vacuum of space. #NewYearsResolution"},
"name": {"S": "ExpensiveWinos"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "Minneapolis"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "84"},
"tweet_text": { "S": "For 2015, I resolve to continue my tradition of not losing any duels I have with former Vice President Aaron Burr. #NewYearsResolution"},
"name": {"S": "ExpensiveWinos"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "Minneapolis"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "85"},
"tweet_text": { "S": "#NewYearsResolution do everything it takes to meet taylor"},
"name": {"S": "howugethegirl"},
"gender": {"S": "female"},
"resolution_category": {"S": "Family/Friends/Relationships"},
"retweet_count": {"S": "0"},
"location": {"S": "miami"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "86"},
"tweet_text": { "S": "@KennedyNation my #NewYearsResolution is Job, Boyfriend, Preparing for 2016 POTUS elections, and gaining responsibilities. #FoxNews2015"},
"name": {"S": "STERLINGMHOLMES"},
"gender": {"S": "male"},
"resolution_category": {"S": "Career"},
"retweet_count": {"S": "0"},
"location": {"S": "Las Vegas NV"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "87"},
"tweet_text": { "S": "My #NewYearsResolution is to drink more!!!"},
"name": {"S": "TheMikeTrigguh"},
"gender": {"S": "male"},
"resolution_category": {"S": "Recreation & Leisure"},
"retweet_count": {"S": "0"},
"location": {"S": "Texas"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "88"},
"tweet_text": { "S": "My #NewYearsResolution is to watch what I eat. My belly sitting on swole _Ù÷_"},
"name": {"S": "MikeStone601"},
"gender": {"S": "male"},
"resolution_category": {"S": "Health & Fitness"},
"retweet_count": {"S": "0"},
"location": {"S": "601 - Mississippi - Ju City "}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "89"},
"tweet_text": { "S": "Try not to bitch about my 2014 Christmas bonus every single day. #NewYearsResolution"},
"name": {"S": "shoutabyss"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "The Abyss, Portland, Oregon"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "90"},
"tweet_text": { "S": "Out with the old and in with the new #NewYearsResolution"},
"name": {"S": "Beens03"},
"gender": {"S": "female"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "new york"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "91"},
"tweet_text": { "S": "#NewYearsResolution To learn how to play a completely new instrument, probably the Cello."},
"name": {"S": "ASonOfTheOne"},
"gender": {"S": "male"},
"resolution_category": {"S": "Education/Training"},
"retweet_count": {"S": "0"},
"location": {"S": "The Lone Star State"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "92"},
"tweet_text": { "S": "Happy New Year Eve my resolution will be taking more pictures of me and drink no soda #NewYearsResolution"},
"name": {"S": "alecm711"},
"gender": {"S": "male"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "L.A "}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "93"},
"tweet_text": { "S": "#NewYearsResolution: Be positive about every situation I step into."},
"name": {"S": "saralinger"},
"gender": {"S": "female"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "Belton South Carolina"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "94"},
"tweet_text": { "S": "Get Money, Grind Harder, Stay Focused, Work on a better attitude. _Ù÷ö‰Ï__ÙÕ»_ÙÕ¡_ÙÒ__Ù_÷‰Ïö #NewYearsResolution"},
"name": {"S": "_inkeddUpShawty"},
"gender": {"S": "male"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "0"},
"location": {"S": "Saginaw "}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "95"},
"tweet_text": { "S": "When midnight hits, Ill still be reading The Fellowship of the Ring. #NewYearsResolution : Gonna finish all three + Hobbit before Jan ends."},
"name": {"S": "CinderAndAsh"},
"gender": {"S": "female"},
"resolution_category": {"S": "Recreation & Leisure"},
"retweet_count": {"S": "0"},
"location": {"S": "Peru, IN"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "96"},
"tweet_text": { "S": "Just updated my fighter profile. Hopefully returning to training full time and getting back into it in the new year. #NewYearsResolution"},
"name": {"S": "lowkick89"},
"gender": {"S": "male"},
"resolution_category": {"S": "Health & Fitness"},
"retweet_count": {"S": "0"},
"location": {"S": "Orange County, California"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "97"},
"tweet_text": { "S": "@parksandrecnbc: Avoid getting Jammed in 2015. #NewYearsResolution @calmedoctorhuey"},
"name": {"S": "TheRealWillyC"},
"gender": {"S": "male"},
"resolution_category": {"S": "Time Management/Organization"},
"retweet_count": {"S": "0"},
"location": {"S": "Snow City, PA"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "98"},
"tweet_text": { "S": "My #NewYearsResolution to be #backstage for ONE of @AdventureDub s performances! _Ù÷±_Ù÷ #Music #LoveThisMoment http://t.co/n4nL5mpy04"},
"name": {"S": "almatkinson"},
"gender": {"S": "female"},
"resolution_category": {"S": "Recreation & Leisure"},
"retweet_count": {"S": "0"},
"location": {"S": "Los Angeles, CA "}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "99"},
"tweet_text": { "S": "RT @NinaHermes: Be less of a bitch, more of a cunt. #NewYearsResolution"},
"name": {"S": "Patrick_Pfohl"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "1"},
"location": {"S": "Chicago, Illinois"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "100"},
"tweet_text": { "S": "&gt;@MarkPavelich my #NewYearsResolution &amp; wish is to be more like you in 2015, work hard, live life &amp; have lots of fun. Happy New Years #NYE"},
"name": {"S": "JudyJackson44"},
"gender": {"S": "female"},
"resolution_category": {"S": "Personal Growth"},
"retweet_count": {"S": "1"},
"location": {"S": "Manhattan New York USA via Edm"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "101"},
"tweet_text": { "S": "#NewYearsResolution(s): 1) Secure the apartment Im getting w/ 1 or 2 ladyfriends. 2) Be less of a fatty. 3) Form a new rock n roll band."},
"name": {"S": "davetheuseless"},
"gender": {"S": "male"},
"resolution_category": {"S": "Health & Fitness"},
"retweet_count": {"S": "0"},
"location": {"S": "New Jersey"}
}'

  aws dynamodb put-item \
    --no-cli-pager \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --table-name $NEW_YEAR_RESOLUTIONS \
    --item '{
"tweet_id": { "S": "102"},
"tweet_text": { "S": "More tweeting less paying attention to the road #NewYearsResolution"},
"name": {"S": "Ferrarious77"},
"gender": {"S": "male"},
"resolution_category": {"S": "Humor"},
"retweet_count": {"S": "0"},
"location": {"S": "Rhode Island"}
}'

echo "Done!"
}

create_new_year_resolution_table
populate_new_year_resolution_table
