document.getElementById('loginBtn').addEventListener('click', function(event) {
    // Get email and password values
    var email = document.getElementById('exampleInputEmail1').value;
    var password = document.getElementById('exampleInputPassword1').value;

    // Email validation
    var emailError = document.getElementById('emailError');
    if (!email || !validateEmail(email)) {
        emailError.style.display = 'block';
        event.preventDefault(); // Prevent form submission
    } else {
        emailError.style.display = 'none';
    }

    // Password validation
    var passwordError = document.getElementById('passwordError');
    var passwordchar=document.getElementById('passwordchar');
    if (!password || password.length < 8 ) {
        passwordError.style.display = 'block';
        event.preventDefault(); // Prevent form submission
    } else if(!validatePassword(password)){
        passwordchar.style.display = 'block';
        passwordError.style.display = 'none';
    }
    else {
        passwordError.style.display = 'none';
    }
});

// Simple email validation function
function validateEmail(email) {
    // Regex to only allow lowercase letters, digits, and special characters in the email
    var re = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
    return( re.test(String(email)));
}


// Password validation function (contains letters and numbers, and is at least 8 characters long)
function validatePassword(password) {
    var re = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,}$/;
    return re.test(password);
}