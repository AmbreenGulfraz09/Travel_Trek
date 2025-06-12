document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('contactForm');
    const nameError = document.getElementById('nameError');
    const emailError = document.getElementById('emailError');
    
    // Validation functions
    function validateUsername(username) {
        const nameRegex = /^[a-zA-Z][a-zA-Z0-9-]*$/;
       

        
        // Reset error message
        nameError.textContent = "";
        
        if (username.length < 3) {
            nameError.textContent = "Name must be at least 3 characters long.";
            return false;
        }
        
        if (!nameRegex.test(username)) {
            nameError.textContent = "Name must start with a letter, can include numbers or hyphens, and cannot have special characters.";
            return false;
        }
        
        if (emailRegex.test(username)) {
            nameError.textContent = "Name cannot be an email address.";
            return false;
        }
        
        return true;
    }
    
    function validateEmail(email) {
        // Regex to validate email format (case-insensitive)
        const emailRegex = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.com$/;

        
        // Reset error message
        emailError.textContent = "";
        
        if (!email || !emailRegex.test(email)) {
            emailError.textContent = "Please enter a valid email address.";
            return false;
        }
        
        return true;
    }
    
    // Form submission handler
    form.addEventListener('submit', function(e) {
        e.preventDefault();
        
        const username = document.getElementById('id_username').value.trim();
        const email = document.getElementById('id_email').value.trim();
        
        // Validate form fields
        const isUsernameValid = validateUsername(username);
        const isEmailValid = validateEmail(email);
        
        // If validation fails, don't submit
        if (!isUsernameValid || !isEmailValid) {
            return false;
        }
        
        // Clear any previous error messages
        nameError.textContent = '';
        emailError.textContent = '';
        
        // Prepare form data for submission
        const formData = new FormData(form);
        
        // Submit form via AJAX
        fetch(contactUrl, {
            method: 'POST',
            body: formData,
            headers: {
                'X-Requested-With': 'XMLHttpRequest',
                'X-CSRFToken': csrfToken
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Your message has been sent successfully!');
                form.reset();
                // Clear any error messages
                nameError.textContent = '';
                emailError.textContent = '';
            } else {
                // Display server-side validation errors
                if (data.errors) {
                    if (data.errors.username) {
                        nameError.textContent = data.errors.username;
                    }
                    if (data.errors.email) {
                        emailError.textContent = data.errors.email;
                    }
                    if (data.errors.message) {
                        // You might want to add a message error span in your HTML
                        console.error('Message error:', data.errors.message);
                    }
                }
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('An error occurred while sending your message. Please try again.');
        });
    });
    
    // Optional: Real-time validation on input
    document.getElementById('id_username').addEventListener('blur', function() {
        validateUsername(this.value.trim());
    });
    
    document.getElementById('id_email').addEventListener('blur', function() {
        validateEmail(this.value.trim());
    });
});