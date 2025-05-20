<img src="./readme/title1.svg"/>

<br><br>

<!-- project overview -->
<img src="./readme/title2.svg"/>

>Hey fellow gym batal 😄,

>I've got a present for you! Meet Batal, a mobile app designed to take your performance to
>beast level. With its powerful AI pose detector, it will track 🕵️, evaluate ✅, and provide live
>feedback to help you correct your form in real time!

>But that’s just the beginning. Batal also includes a smart chatbot 🤖 that refines its answers just for
>you, based on your history. Also, no more overthinking your next workout habibi!
>Batal’s recommendation system suggests effective exercises for you so that you stay
>pumped for the regular social media-style posts , live chat rooms and a gamified leaderboard 🎯


>Habibi, download Batal.



<br><br>

<!-- System Design -->
<img src="./readme/title3.svg"/>

### ER Diagram1

<p >
    <img src="./readme/system-design/ER-diagram.png" width="100%" height='1000px'/>
</p>

### ER Diagram2

<p >
    <img src="./readme/system-design/ER-diagram2 (2).png" width="100%" />
</p>

### System Architecture

<p >
    <img src="./readme/system-design/components diagram.png" width="100%"/>
</p>

### HTTP Request Lifecycle

<p >
    <img src="./readme/system-design/request flow.png" width="100%"/>
</p>

<br><br>

<!-- Project Highlights -->
<img src="./readme/title4.svg"/>

### Experience the magic

- AI-powered pose detector with live feedback for each exercice.
- AI assistant that gives personalized advice based on previous interactions and profile.
- Recommendation system for exercices.
- Feed section for posts and stories.
- Live chatting system using node's websockets.

<br><br>

<!-- Demo -->
<img src="./readme/title5.svg"/>

### User Screens (Mobile)

| Pose Detector | Chatbot | Recommender system |
| ------------- | ------- | ------------------ |
| <img src="./readme/demo/feedback.gif" height="400"/> | <img src="./readme/demo/chatbot%20refined.gif" height="400"/> | <img src="./readme/demo/recommender-system%20refined.gif" height="400"/> |


### User Screens (Mobile)

| Social feed | Gamified leaderboard | Recommender system |
| ------------- | ------- | ------------------ |
| <img src="./readme/demo/feed.gif" height="400"/> | <img src="./readme/demo/leaderboard.gif" height="400"/> | <img src="./readme/demo/recommender-system%20refined.gif" height="400"/> |


### Admin Screens (Web)

| Login screen                            | Register screen                       |
| --------------------------------------- | ------------------------------------- |
| ![Landing](./readme/demo/1440x1024.png) | ![fsdaf](./readme/demo/1440x1024.png) |


<br><br>

<!-- Development & Testing -->
<img src="./readme/title6.svg"/>

### Add Title Here


| Services                            | Validation                       | Testing                        |
| --------------------------------------- | ------------------------------------- | ------------------------------------- |
| ![Landing](./readme/development-testing/service.png) | ![fsdaf](./readme/development-testing/validation-request.png) | ![fsdaf](./readme/development-testing/tests.png) |


<br><br>

<!-- Deployment -->
<img src="./readme/title7.svg"/>

### CI/CD Workflows

- We start developing a new feature on a local branch
- We push said branch on its remote counterpart
- We merge remote branch to stage
- Github actions start the workflows
- Github actions attempt booting the database,then makes the migrations,testing and serving
- If CI succeeds,we proceed with staging CD
- Github actions pushes the code to the staging AWS EC2 instance and executes the deployment script
- The deployment script builds docker containers for laravel,node, database and react,one for each
- Once the feature is finished we merge stage to main
- Github actions takes the same staging CD steps again but for production

<p >
    <img src="./readme/development-testing/workflows.png" width="100%"/>
</p>

| Postman API 1                            | Postman API 2                       | Postman API 3                        |
| --------------------------------------- | ------------------------------------- | ------------------------------------- |
| ![Landing](./readme/demo/1440x1024.png) | ![fsdaf](./readme/demo/1440x1024.png) | ![fsdaf](./readme/demo/1440x1024.png) |

<br><br>
