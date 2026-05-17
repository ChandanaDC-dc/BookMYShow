function addMessage(message, type){

    let div =
        document.createElement("div");

    div.className =
        "message " + type;

    div.innerText = message;

    document
        .getElementById("chat-body")
        .appendChild(div);

    document
        .getElementById("chat-body")
        .scrollTop =
        document
        .getElementById("chat-body")
        .scrollHeight;
}

function handleEnter(event){

    if(event.key === "Enter"){

        sendMessage();
    }
}

function sendMessage(){

    let input =
        document.getElementById(
            "userMessage"
        );

    let msg = input.value.trim();

    if(msg === "") return;

    addMessage(msg, "user");

    input.value = "";

    fetch(
        "http://localhost:8080/BookMyShow/chatbot",

        {

            method: "POST",

            headers: {

                "Content-Type":
                "application/x-www-form-urlencoded"
            },

            body:
                "message=" +
                encodeURIComponent(msg)
        }
    )

    .then(response => response.text())

    .then(data => {

        addMessage(data, "bot");
    })

    .catch(error => {

        addMessage(
            "Server error. Try again.",
            "bot"
        );

        console.log(error);
    });
}