document.getElementById('submit').addEventListener('click', function (event) {
    const nameInput = document.getElementById("exampleInputEmail1").value.trim();
    const nameError = document.getElementById("nameError");


    // Regular expression to allow strings with optional numbers, but not emails
    const nameRegex = /^[a-zA-Z][a-zA-Z0-9-]*$/; // Must start with a letter, can include numbers and hyphens, no special characters
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    // Reset error message
    nameError.textContent = "";

    if (nameInput.length < 3) {
        nameError.textContent = "Name must be at least 2 characters long.";
        console.log(nameError.textContent);
        event.preventDefault();
        // return false;
        console.log(nameInput);
    }

    if (!nameRegex.test(nameInput)) {
        nameError.textContent = "Name must start with a letter, can include numbers or hyphens, and must not have special characters.";
        console.log(nameError.textContent);
        event.preventDefault();
        console.log(nameError.textContent);
        // return false;
    }

    if (emailRegex.test(nameInput)) {
        nameError.textContent = "Name cannot be an email address.";
        event.preventDefault();
        return false;
    }




    // Email validation
    const emailError = document.getElementById("emailError");
    var email = document.getElementById('exampleInputEmail1').value;
    if (!email || !validateEmail(email)) {
        emailError.textContent = "Invalid email address.";

    } else {
        emailError.textContent = ""
    }

    function validateEmail(email) {
        // Regex to only allow lowercase letters, digits, and special characters in the email
        var re = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
        return (re.test(String(email)));
    }
    return true; // Allow form submission if validation passes
});


// Data saving 
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('contactForm');
    
    form.addEventListener('submit', function(e) {
        e.preventDefault();
        
        const formData = new FormData(form);
        
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
            } else {
                // Clear previous error messages
                document.getElementById('nameError').textContent = '';
                document.getElementById('emailError').textContent = '';
                
                // Display new error messages if any
                if (data.errors && data.errors.username) {
                    document.getElementById('nameError').textContent = data.errors.username;
                }
                if (data.errors && data.errors.email) {
                    document.getElementById('emailError').textContent = data.errors.email;
                }
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });
});