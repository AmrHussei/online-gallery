# online-gallery

The idea of this application is that the user logs in the Authentication done using API, and then the user can upload any image on his device to the server, and it is stored accordingly with the token, so that each user has his own copy of the data. The images are uploaded using the gallery or camera

## Used Tools
- Flutter  
- Dart
- BloC
- Postman
- image picker

## video


https://user-images.githubusercontent.com/94804979/219868733-a49ecaf8-73f7-4aeb-a498-1e5b9528b96e.mp4



## Features & Screens

- Log in screen
- Home Screen

## Screenshots
![1](https://user-images.githubusercontent.com/94804979/219868298-6cdfd348-5e17-4040-a9df-7bbdb0c78de0.png)
![2](https://user-images.githubusercontent.com/94804979/219868304-105474ba-f251-4e0f-bbdc-a94d7dc6f88a.png)
![3](https://user-images.githubusercontent.com/94804979/219868311-b1252134-9e4c-434a-9253-4f21bd39a968.png)
![4](https://user-images.githubusercontent.com/94804979/219868318-c7a3aede-6ddb-4f3c-aa5a-00de082ec347.png)



## Color Reference

| Color             |Hex                                                                |
| ----------------- | ------------------------------------------------------------------ |
| blue | #7BB3FF|
| blackMainText | #4A4A4A |
| pink | #988F8C |
| blackSubText | #988F8C |
| greeyTextFormField | #F7F7F7 |



## API Reference from pexels
## Base URL https://technichal.prominaagency.com/api/


#### Authentication Request

```http
  POST auth/login 
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `email` | `string` | **Required**. |
| `password` | `string` | **Required**.  |

#### For  upload image

```http
  POST upload
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `token` | `string` | **Required**. Your token |

#### Payment Key Request

```http
  GET my-gallery
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `token` | `string` | **Required**. Your first token |


## Packages
![0](https://user-images.githubusercontent.com/94804979/219868582-2acfaa80-f1ef-4712-ab1e-daa7586386d0.png)


## Feedback
If you have any feedback, please reach out to me at amr.flutter.dev@gmail.com

## You can follow me on 
<a href="https://www.linkedin.com/in/amr-hussein-51a141220/">
         <img alt="Qries" src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"
         >
         
    
### Also You can contact  me 
```http
  020 102 854 4373
```

reference.
