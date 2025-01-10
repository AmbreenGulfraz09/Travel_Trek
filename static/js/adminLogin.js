document.getElementById('loginBtn').addEventListener('click', function (event) {
    // Get email and password values
    var email = document.getElementById('exampleInputEmail1').value;
    var password = document.getElementById('exampleInputPassword1').value;
    let isValid = true;
    // Email validation
    var emailError = document.getElementById('emailError');
    if (!email || !validateEmail(email)) {
        emailError.style.display = 'block';
        isValid = false;
        event.preventDefault(); // Prevent form submission
    } else {
        emailError.style.display = 'none';
    }
   
    // // Password validation
    // if (!password) {
    //     emptypassword.style.display = 'block';
    //     passwordchar.style.display = 'none';
    //     passwordError.style.display = 'none';
    //     isValid = false;
    // } else if (password.length < 8) {
    //     passwordError.style.display = 'block';
    //     passwordchar.style.display = 'none';
    //     emptypassword.style.display = 'none';
    //     isValid = false;
    // } else if (!validatePassword(password)) {
    //     passwordchar.style.display = 'block';
    //     passwordError.style.display = 'none';
    //     emptypassword.style.display = 'none';
    //     isValid = false;
    // } else {
    //     emptypassword.style.display = 'none';
    //     passwordError.style.display = 'none';
    //     passwordchar.style.display = 'none';
    // }

    // Submit form if validation succeeds
    if (isValid) {
        // Redirect to admin dashboard if validation passes
        const adminDashboardUrl = document.getElementById('loginBtn').dataset.url;
        window.location.href = adminDashboardUrl;
    }




    // Simple email validation function
    function validateEmail(email) {
        // Regex to only allow lowercase letters, digits, and special characters in the email
        var re = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
        return (re.test(String(email)));
    }



    // Password validation function (letters, numbers, min 8 chars)
    function validatePassword(password) {
        var re = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,}$/;
        return re.test(password);
    }

});