document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('adminLoginForm');
    
    // Only add this event listener if we can use fetch API
    if (window.fetch) {
        form.addEventListener('submit', handleSubmit);
    }
    
    function handleSubmit(e) {
        e.preventDefault();
        
        // Get form values for validation
        const email = document.getElementById('exampleInputEmail1').value;
        const password = document.getElementById('exampleInputPassword1').value;
        
        // Get error elements
        const emailError = document.getElementById('emailError');
        const passwordError = document.getElementById('passwordError');
        const passwordchar = document.getElementById('passwordchar');
        const emptypassword = document.getElementById('emptypassword');
        const loginError = document.getElementById('loginError');
        
        // Reset all error messages
        emailError.style.display = 'none';
        passwordError.style.display = 'none';
        passwordchar.style.display = 'none';
        emptypassword.style.display = 'none';
        loginError.style.display = 'none';
        
        // Validation flag
        let isValid = true;
        
        // Email validation
        if (!email || !validateEmail(email)) {
            emailError.style.display = 'block';
            isValid = false;
        }
        
        // Password validation
        if (!password) {
            emptypassword.style.display = 'block';
            isValid = false;
        } else if (password.length < 8) {
            passwordError.style.display = 'block';
            isValid = false;
        } else if (!validatePassword(password)) {
            passwordchar.style.display = 'block';
            isValid = false;
        }
        
        // Only proceed with AJAX if validation passes
        if (isValid) {
            const formData = new FormData(form);
            const dashboardUrl = document.getElementById('loginBtn').getAttribute('data-url');
            
            fetch(window.location.href, {
                method: 'POST',
                body: formData,
                headers: {
                    'X-Requested-With': 'XMLHttpRequest',
                    'X-CSRFToken': document.querySelector('[name=csrfmiddlewaretoken]').value
                }
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // Redirect to admin dashboard
                    window.location.href = dashboardUrl;
                } else {
                    // Show the error message at the top of the form
                    loginError.textContent = "Login Unsuccessful: " + data.message;
                    loginError.style.display = 'block';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                // If AJAX fails, submit the form normally
                form.removeEventListener('submit', handleSubmit);
                form.submit();
            });
        }
    }
    
    // Email validation function
    function validateEmail(email) {
        const re = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
        return re.test(email);
    }
    
    // Password validation function
    function validatePassword(password) {
        const re = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,}$/;
        return re.test(password);
    }
});