<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>𝓼𝓢𝓻𝓑𝓲𝓽𝓮𝓼💖⚡ - Login</title>
    <link rel="stylesheet" href="Style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Helvetica+Neue&display=swap"
      rel="stylesheet"
    />
  
    <script type="importmap">
      {
        "imports": {
          "react": "https://aistudiocdn.com/react@^19.2.0",
          "react-dom/": "https://aistudiocdn.com/react-dom@^19.2.0/",
          "react/": "https://aistudiocdn.com/react@^19.2.0/"
        }
      }
    </script>
  </head>
  <body>
    <div class="container">
      <div class="auth-wrapper">
        <!-- Image and Welcome Section -->
        <div class="welcome-section">
          <img
            src="https://images.unsplash.com/photo-1579027989536-b7b1f875659b?auto=format&fit=crop&w=900&q=80"
            alt="A beautiful and delicious dish served at a restaurant."
          />
          <div class="welcome-overlay">
            <h1> 𝓼𝓢𝓻𝓑𝓲𝓽𝓮𝓼💖⚡</h1>
            <p>
             When you think food — think 𝓼𝓢𝓻𝓑𝓲𝓽𝓮𝓼💖⚡..
            </p>
          </div>
        </div>

        <!-- Form Section -->
        <div class="form-section">
          <div class="form-container">
            <h2>Welcome Back</h2>
            <p class="subtitle">Hungry ?  Stop scrolling — start ordering ⚡</p>

            <form action="${pageContext.request.contextPath}/Login_servlet" method="POST" class="auth-form">
              <div class="form-group">
                <label for="email" class="sr-only">Email Address</label>
                <span class="icon">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke-width="1.5"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75"
                    />
                  </svg>
                </span>
                <input
                  type="email"
                  id="email"
                  name="email"
                  placeholder="Email Address"
                  required
                  class="form-input"
                />
              </div>
              <div class="form-group">
                <label for="password" class="sr-only">Password</label>
                <span class="icon">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke-width="1.5"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      d="M16.5 10.5V6.75a4.5 4.5 0 00-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z"
                    />
                  </svg>
                </span>
                <input
                  type="password"
                  id="password"
                  name="password"
                  placeholder="Password"
                  required
                  class="form-input"
                />
              </div>
              <button type="submit" class="submit-btn">Sign In</button>
            </form>

            <p class="toggle-text">
              Don't have an account?
              <a href="Register.jsp" class="toggle-link">Sign Up</a>
            </p>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>