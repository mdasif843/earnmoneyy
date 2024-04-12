<!DOCTYPE html>

<html lang="en">
<head>

    <meta charset="UTF-8">


    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Money Counter Pro</title>

    <style>


        body {

            font-family: 'Arial', sans-serif;

            background-color: #f8f9fa;


            margin: 0;

            padding: 0;

            display: flex;

            flex-direction: column;

            align-items: center;

        }



        .header {

            display: flex;

            justify-content: space-between;

            align-items: center;

            padding: 20px;

            background-color: #343a40;

            color: #fff;

            width: 100%;

            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);

        }



        .counter {

            font-size: 24px;

            margin-right: 10px;

            color: #fff;

        }



        .main {

            display: flex;

            flex-wrap: wrap;

            justify-content: space-around;

            padding: 20px;

            width: 100%;

        }



        button {

            margin: 10px;

            padding: 15px;

            cursor: pointer;

            background-color: #007bff;

            color: #fff;

            border: none;

            border-radius: 5px;

            font-size: 16px;

            transition: background-color 0.3s;

        }



        button:hover {

            background-color: #0056b3;

        }



        #countdown, #signupForm, #withdrawMessage {

            text-align: center;

            margin-top: 20px;

            color: #555;

        }



        form {

            display: flex;

            flex-direction: column;

            align-items: center;

        }



        label {

            margin-bottom: 10px;

            color: #555;

        }



        input {

            padding: 10px;

            margin-bottom: 15px;

            width: 200px;

            font-size: 16px;

            border: 1px solid #ced4da;

            border-radius: 5px;

            transition: border-color 0.3s;

        }



        input:focus {

            border-color: #007bff;

        }



        #withdrawBtn {

            background-color: #dc3545;

        }



        #withdrawBtn:hover {

            background-color: #c82333;

        }

    </style>

</head>

<body>

    <div class="header">

        <div class="counter">$<span id="moneyCounter">0</span></div>

        <button onclick="withdraw()" id="withdrawBtn">Withdraw</button>

    </div>

    

    <div class="main" id="buttonContainer">

        <script>

            for (let i = 1; i <= 20; i++) {

                const button = document.createElement('button');

                button.textContent = 'Click here to earn $0.5';

                button.onclick = function() {

                    startProcess('https://www.toprevenuegate.com/ikdpw0gv6?key=1420d0f50983b0e17883a2a9dfaef748', 20);

                };

                document.getElementById('buttonContainer').appendChild(button);

            }

        </script>

    </div>



    <div id="countdown">Waiting for 0 seconds...</div>



    <div id="signupForm">

        <h2>Sign Up</h2>

        <form onsubmit="signup(event)">

            <label for="username">Username:</label>

            <input type="text" id="username" required>

            <button type="submit">Sign Up</button>

        </form>

    </div>



    <div id="withdrawMessage"></div>



    <script>

        let moneyCounter = 0;

        let username;



        const storedUsername = localStorage.getItem('username');

        if (storedUsername) {

            username = storedUsername;

            document.getElementById('signupForm').style.display = 'none';

            const storedMoney = localStorage.getItem(`${username}_money`);

            if (storedMoney) {

                moneyCounter = parseFloat(storedMoney);

                document.getElementById('moneyCounter').innerHTML = moneyCounter;

            }

        }



        function signup(event) {

            event.preventDefault();

            username = document.getElementById('username').value;

            localStorage.setItem('username', username);

            document.getElementById('signupForm').style.display = 'none';

        }



        function startProcess(link, seconds) {

            const newWindow = window.open(link, '_blank', 'height=500,width=500');



            // Countdown for automatic closure

            window.setTimeout(function () {

                if (!newWindow.closed) {

                    newWindow.close();

                }

            }, seconds * 1000);



            countdown(seconds, newWindow);

        }



        function countdown(seconds, newWindow) {

            let countdown = seconds;

            let moneyAdded = false;



            const countdownInterval = setInterval(function () {

                document.getElementById('countdown').innerHTML = `Waiting for ${countdown} seconds...`;

                countdown--;



                if (countdown < 0) {

                    clearInterval(countdownInterval);



                    if (!moneyAdded) {

                        moneyCounter += 0.5;

                        document.getElementById('moneyCounter').innerHTML = moneyCounter;

                        localStorage.setItem(`${username}_money`, moneyCounter.toString());

                    }



                    if (newWindow) {

                        newWindow.close();

                    }

                }

            }, 1000);



            // Check if the window is closed

            const checkClosed = setInterval(function () {

                if (newWindow.closed) {

                    clearInterval(countdownInterval);

                    if (!moneyAdded) {

                        document.getElementById('withdrawMessage').innerHTML = 'YOU HAVE CLOSED THE AD BEFORE THE TIMER ENDS';

                        // Don't subtract money if the window is closed

                        setTimeout(() => {

                            document.getElementById('withdrawMessage').innerHTML = '';

                        }, 10000);

                    }

                }

            }, 1000);

        }



        function withdraw() {

            const minimumWithdrawal = 100;

            if (moneyCounter >= minimumWithdrawal) {

                moneyCounter = 0;

                localStorage.setItem(`${username}_money`, '0');

                document.getElementById('moneyCounter').innerHTML = moneyCounter;

                document.getElementById('withdrawMessage').innerHTML = '';

            } else {

                document.getElementById('withdrawMessage').innerHTML = 'Minimum withdrawal amount is $50.';

                setTimeout(() => {

                    document.getElementById('withdrawMessage').innerHTML = '';

                }, 10000);

            }

        }

    </script>

</body>

</html>
