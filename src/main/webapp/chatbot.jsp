<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<div id="chatBox"
style="
width:320px;
height:420px;
background:white;
position:fixed;
bottom:90px;
right:20px;
border-radius:20px;
box-shadow:0 10px 30px rgba(0,0,0,0.2);
display:flex;
flex-direction:column;
overflow:hidden;
z-index:9999;
">

<div style="
background:#f84464;
color:white;
padding:14px;
font-weight:bold;
">
Movie Assistant
</div>

<div id="messages"
style="
flex:1;
padding:10px;
overflow-y:auto;
font-size:14px;
background:#f5f5f5;
">
</div>

<div style="
display:flex;
padding:10px;
gap:8px;
border-top:1px solid #ddd;
">

<input type="text"
id="userMessage"
placeholder="Ask movies..."
style="
flex:1;
padding:10px;
border-radius:10px;
border:1px solid #ccc;
outline:none;
">

<button onclick="sendMessage()"
style="
background:#f84464;
color:white;
border:none;
padding:10px 16px;
border-radius:10px;
cursor:pointer;
">
Send
</button>

</div>
</div>

<script>

function addMessage(text, sender){

    let msg = document.createElement("div");

    msg.style.margin = "8px 0";
    msg.style.padding = "10px";
    msg.style.borderRadius = "10px";
    msg.style.maxWidth = "85%";
    msg.style.whiteSpace = "pre-line";

    if(sender === "user"){

        msg.style.background = "#f84464";
        msg.style.color = "white";
        msg.style.marginLeft = "auto";

    }else{

        msg.style.background = "#e5e7eb";
        msg.style.color = "#111";
    }

    msg.innerText = text;

    document.getElementById("messages")
        .appendChild(msg);

    document.getElementById("messages")
        .scrollTop =
document.getElementById("messages").scrollHeight;
}

function sendMessage(){

    let input =
document.getElementById("userMessage");

    let message = input.value.trim();

    if(message === ""){
        return;
    }

    addMessage(message, "user");

    fetch("chatbot", {

        method: "POST",

        headers: {
            "Content-Type":
"application/x-www-form-urlencoded"
        },

        body:
"message=" + encodeURIComponent(message)

    })

    .then(response => response.text())

    .then(data => {

        addMessage(data, "bot");
    })

    .catch(error => {

        addMessage(
            "Server error occurred",
            "bot"
        );

        console.log(error);
    });

    input.value = "";
}
</script>