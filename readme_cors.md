Open the GCP console (https://console.cloud.google.com), select your project and start a cloud terminal session by clicking the >_ icon button in the top navbar.

Click the open editor button (pencil icon), then create the cors.json file. The cors.json file should look like this:

[
  {
    "origin": ["*"],
    "method": ["GET"],
    "maxAgeSeconds": 3600
  }
]
I set the origin to * which means that every website can display your images. But you can also insert the domain of your website there to restrict access.

Go to your firebase console and open firebase storage there you find gs://

Run gsutil cors set cors.json gs://your-bucket