<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Offers & Gift Cards - Scratch to Win!</title>
    <link rel="stylesheet" href="css/bms-theme.css" />
    <style>
        .scratch-page-wrapper {
            min-height: calc(100vh - 80px);
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 40%, #0f3460 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
            color: white;
            flex-direction: column;
            text-align: center;
        }

        .scratch-header h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            font-weight: 800;
        }

        .scratch-header p {
            font-size: 1.1rem;
            opacity: 0.8;
            margin-bottom: 40px;
            max-width: 500px;
        }

        .scratch-card-container {
            position: relative;
            width: 320px;
            height: 320px;
            border-radius: 20px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.5);
            background: white;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            color: var(--text);
            border: 4px solid #ffd700;
        }

        .prize-content {
            text-align: center;
            padding: 20px;
            z-index: 1;
        }

        .prize-icon {
            font-size: 4rem;
            margin-bottom: 10px;
        }

        .prize-text {
            font-size: 1.5rem;
            font-weight: 800;
            color: var(--bms-red);
            margin: 0;
            line-height: 1.2;
        }

        .prize-sub {
            font-size: 0.9rem;
            color: var(--text-muted);
            margin-top: 8px;
        }

        #scratch-canvas {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 2;
            cursor: pointer;
            border-radius: 16px;
        }

        .action-btns {
            margin-top: 40px;
            display: flex;
            gap: 16px;
        }

        .btn-refresh {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.4);
            padding: 12px 24px;
            border-radius: 50px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-refresh:hover {
            background: rgba(255, 255, 255, 0.3);
        }

        .won-animation {
            animation: pop 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
        }

        @keyframes pop {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        /* Confetti Canvas */
        #confetti {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 999;
        }
    </style>
</head>

<body class="bms-body">
    <jsp:include page="navbar.jsp" />

    <canvas id="confetti"></canvas>

    <div class="scratch-page-wrapper">
        <div class="scratch-header">
            <h1>Your Special Reward!</h1>
            <p>Scratch the card below to reveal your exclusive BookMyShow offer.</p>
        </div>

        <div class="scratch-card-container" id="card-container">
            <!-- Hidden Prize underneath the canvas -->
            <div class="prize-content">
                <div class="prize-icon" id="prize-icon">🎁</div>
                <h2 class="prize-text" id="prize-text">50% Off<br>Next Movie</h2>
                <p class="prize-sub" id="prize-sub">Use code BMS50 at checkout</p>
            </div>
            
            <!-- Canvas to scratch off -->
            <canvas id="scratch-canvas"></canvas>
        </div>

        <div class="action-btns">
            <a href="index.jsp" class="bms-btn bms-btn-primary">Back to Home</a>
            <button class="btn-refresh" onclick="initCard()">Try Another Card</button>
        </div>
    </div>

    <script>
        const canvas = document.getElementById('scratch-canvas');
        const ctx = canvas.getContext('2d');
        const cardContainer = document.getElementById('card-container');
        
        let isDrawing = false;
        let lastX = 0;
        let lastY = 0;
        let isRevealed = false;

        const prizes = [
            { icon: "🍿", text: "Free Large Popcorn", sub: "Present this code: POPBMS" },
            { icon: "🎟️", text: "Buy 1 Get 1 Free", sub: "Use code BOGO24 at checkout" },
            { icon: "💰", text: "₹100 Cashback", sub: "Credited to BMS Wallet" },
            { icon: "⭐", text: "50% Off Next Movie", sub: "Use code BMS50 at checkout" },
            { icon: "🎭", text: "20% Off Event Tickets", sub: "Valid on all comedy shows" }
        ];

        function resizeCanvas() {
            canvas.width = cardContainer.offsetWidth;
            canvas.height = cardContainer.offsetHeight;
        }

        function fillCanvas() {
            // Draw a shiny silver/gold gradient
            const gradient = ctx.createLinearGradient(0, 0, canvas.width, canvas.height);
            gradient.addColorStop(0, '#e0e0e0');
            gradient.addColorStop(0.5, '#f5f5f5');
            gradient.addColorStop(1, '#c0c0c0');
            
            ctx.fillStyle = gradient;
            ctx.fillRect(0, 0, canvas.width, canvas.height);

            // Add some pattern/text
            ctx.fillStyle = 'rgba(0,0,0,0.1)';
            ctx.font = '24px Inter, sans-serif';
            ctx.textAlign = 'center';
            for(let i=0; i<5; i++) {
                ctx.fillText('SCRATCH ME', canvas.width/2, (canvas.height/5) * i + 40);
            }
        }

        function initCard() {
            isRevealed = false;
            cardContainer.classList.remove('won-animation');
            resizeCanvas();
            fillCanvas();

            // Select random prize
            const prize = prizes[Math.floor(Math.random() * prizes.length)];
            document.getElementById('prize-icon').innerText = prize.icon;
            document.getElementById('prize-text').innerHTML = prize.text;
            document.getElementById('prize-sub').innerText = prize.sub;

            // Reset blend mode
            ctx.globalCompositeOperation = 'source-over';
        }

        function getMousePos(e) {
            const rect = canvas.getBoundingClientRect();
            const clientX = e.touches ? e.touches[0].clientX : e.clientX;
            const clientY = e.touches ? e.touches[0].clientY : e.clientY;
            return {
                x: clientX - rect.left,
                y: clientY - rect.top
            };
        }

        function scratch(e) {
            if (!isDrawing || isRevealed) return;
            e.preventDefault();

            const pos = getMousePos(e);
            
            // Use destination-out to "erase" the canvas
            ctx.globalCompositeOperation = 'destination-out';
            ctx.beginPath();
            ctx.arc(pos.x, pos.y, 25, 0, Math.PI * 2);
            ctx.fill();

            // Check if enough is scratched
            checkReveal();
        }

        function checkReveal() {
            // Check pixel data to see how much is transparent
            const imgData = ctx.getImageData(0, 0, canvas.width, canvas.height);
            const pixels = imgData.data;
            let transparentPixels = 0;

            for (let i = 3; i < pixels.length; i += 4) {
                if (pixels[i] === 0) {
                    transparentPixels++;
                }
            }

            const percentage = (transparentPixels / (pixels.length / 4)) * 100;

            if (percentage > 40 && !isRevealed) {
                isRevealed = true;
                // Fade out the rest of the canvas
                canvas.style.transition = 'opacity 0.5s';
                canvas.style.opacity = '0';
                
                setTimeout(() => {
                    cardContainer.classList.add('won-animation');
                    fireConfetti();
                    // Reset canvas for next play but keep hidden
                    canvas.style.display = 'none';
                    canvas.style.opacity = '1';
                }, 500);
            }
        }

        // Event Listeners
        canvas.addEventListener('mousedown', (e) => { isDrawing = true; scratch(e); });
        canvas.addEventListener('mousemove', scratch);
        canvas.addEventListener('mouseup', () => { isDrawing = false; });
        canvas.addEventListener('mouseleave', () => { isDrawing = false; });

        // Touch support
        canvas.addEventListener('touchstart', (e) => { isDrawing = true; scratch(e); });
        canvas.addEventListener('touchmove', scratch);
        canvas.addEventListener('touchend', () => { isDrawing = false; });

        // Initialize on load
        window.addEventListener('load', initCard);
        window.addEventListener('resize', initCard);

        // Simple Confetti Animation
        function fireConfetti() {
            const canvasConfetti = document.getElementById('confetti');
            const ctxConfetti = canvasConfetti.getContext('2d');
            canvasConfetti.width = window.innerWidth;
            canvasConfetti.height = window.innerHeight;

            const pieces = [];
            const colors = ['#f84464', '#ffd700', '#2e7d32', '#00bcd4', '#ff9800'];

            for (let i = 0; i < 100; i++) {
                pieces.push({
                    x: canvasConfetti.width / 2,
                    y: canvasConfetti.height / 2 + 100,
                    vx: (Math.random() - 0.5) * 20,
                    vy: (Math.random() - 1) * 20 - 5,
                    size: Math.random() * 10 + 5,
                    color: colors[Math.floor(Math.random() * colors.length)],
                    rot: Math.random() * 360,
                    rotSpeed: (Math.random() - 0.5) * 10
                });
            }

            function animate() {
                ctxConfetti.clearRect(0, 0, canvasConfetti.width, canvasConfetti.height);
                let active = false;

                pieces.forEach(p => {
                    p.x += p.vx;
                    p.y += p.vy;
                    p.vy += 0.5; // gravity
                    p.rot += p.rotSpeed;

                    if (p.y < canvasConfetti.height) active = true;

                    ctxConfetti.save();
                    ctxConfetti.translate(p.x, p.y);
                    ctxConfetti.rotate(p.rot * Math.PI / 180);
                    ctxConfetti.fillStyle = p.color;
                    ctxConfetti.fillRect(-p.size/2, -p.size/2, p.size, p.size);
                    ctxConfetti.restore();
                });

                if (active) {
                    requestAnimationFrame(animate);
                } else {
                    ctxConfetti.clearRect(0, 0, canvasConfetti.width, canvasConfetti.height);
                    canvas.style.display = 'block'; // Prepare for next play
                }
            }
            animate();
        }
    </script>
</body>
</html>
