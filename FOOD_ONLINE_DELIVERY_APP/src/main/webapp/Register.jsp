<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>𝓼𝓢𝓻𝓑𝓲𝓽𝓮𝓼💖⚡ - Register</title>
    <link rel="stylesheet" href="Style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Helvetica+Neue&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="auth-wrapper">
            <!-- Image and Welcome Section -->
            <div class="welcome-section">
                <img src="https://images.unsplash.com/photo-1579027989536-b7b1f875659b?auto=format&fit=crop&w=900&q=80" alt="A beautiful and delicious dish served at a restaurant." />
                <div class="welcome-overlay">
                    <h1>Zyro ⚡</h1>
                    <p>When you think food — think 𝓼𝓢𝓻𝓑𝓲𝓽𝓮𝓼💖⚡..</p>
                </div>
            </div>
            
            <!-- Form Section -->
            <div class="form-section">
                <div class="form-container">
                    <h2>Create Account</h2>
                    <p class="subtitle">Create an account — good food will follow you.</p>
                    
                    <form action="Register_servlet" method="POST" class="auth-form">
                        <div class="form-group">
                            <label for="name" class="sr-only">Full Name</label>
                            <span class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z" /></svg>
                            </span>
                            <input type="text" id="name" name="name" placeholder="Full Name" required class="form-input" />
                        </div>
                        <div class="form-group">
                            <label for="username" class="sr-only">Username</label>
                            <span class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M16.5 12a4.5 4.5 0 11-9 0 4.5 4.5 0 019 0zm0 0c0 1.657 1.007 3 2.25 3S21 13.657 21 12a9 9 0 10-2.636 6.364M16.5 12V8.25" /></svg>
                            </span>
                            <input type="text" id="username" name="username" placeholder="Username" required class="form-input" />
                        </div>
                        <div class="form-group">
                            <label for="email" class="sr-only">Email Address</label>
                            <span class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75" /></svg>
                            </span>
                            <input type="email" id="email" name="email" placeholder="Email Address" required class="form-input" />
                        </div>
                        <div class="form-group">
                            <label for="phone" class="sr-only">Phone Number</label>
                            <span class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M2.25 6.75c0 8.284 6.716 15 15 15h2.25a2.25 2.25 0 002.25-2.25v-1.372c0-.516-.351-.966-.852-1.091l-4.423-1.106c-.44-.11-.902.055-1.173.417l-.97 1.293c-.282.376-.769.542-1.21.38a12.035 12.035 0 01-7.143-7.143c-.162-.441.004-.928.38-1.21l1.293-.97c.363-.271.527-.734.417-1.173L6.963 3.102a1.125 1.125 0 00-1.091-.852H4.5A2.25 2.25 0 002.25 6.75z" /></svg>
                            </span>
                            <input type="tel" id="phone" name="phone" placeholder="Phone Number" required class="form-input" />
                        </div>
                         <div class="form-group">
                            <label for="address" class="sr-only">Address</label>
                            <span class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M2.25 12l8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h7.5" /></svg>
                            </span>
                            <input type="text" id="address" name="address" placeholder="Address" required class="form-input" />
                        </div>
                        <input type="hidden" name="role" value="customer">
                        <div class="form-group">
                             <label for="password" class="sr-only">Password</label>
                             <span class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M16.5 10.5V6.75a4.5 4.5 0 00-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z" /></svg>
                            </span>
                            <input type="password" id="password" name="password" placeholder="Password" required class="form-input" />
                        </div>
                        <button type="submit" class="submit-btn">Create Account</button>
                    </form>
                    
                    <p class="toggle-text">
                        Already have an account?
                        <a href="login.jsp" class="toggle-link">Sign In</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>