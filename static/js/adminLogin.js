document.getElementById('loginBtn').addEventListener('click', function (event) {
    // Get email and password values
    const email = document.getElementById('exampleInputEmail1').value;
    const password = document.getElementById('exampleInputPassword1').value;

    // Get error elements
    const emailError = document.getElementById('emailError');
    const passwordError = document.getElementById('passwordError');
    const passwordchar = document.getElementById('passwordchar');
    const emptypassword = document.getElementById('emptypassword');

    // Validation flag
    let isValid = true;

    // Email validation
    if (!email || !validateEmail(email)) {
        emailError.style.display = 'block';
        isValid = false;
    } else {
        emailError.style.display = 'none';
    }

    // Password validation
    if (!password) {
        emptypassword.style.display = 'block';
        passwordchar.style.display = 'none';
        passwordError.style.display = 'none';
        isValid = false;
    } else if (password.length < 8) {
        passwordError.style.display = 'block';
        passwordchar.style.display = 'none';
        emptypassword.style.display = 'none';
        isValid = false;
    } else if (!validatePassword(password)) {
        passwordchar.style.display = 'block';
        passwordError.style.display = 'none';
        emptypassword.style.display = 'none';
        isValid = false;
    } else {
        emptypassword.style.display = 'none';
        passwordError.style.display = 'none';
        passwordchar.style.display = 'none';
    }

    // Redirect or form submission if validation succeeds
    if (isValid) {
        const adminDashboardUrl = document.getElementById('loginBtn').dataset.url;
        window.location.href = adminDashboardUrl;
    } else {
        event.preventDefault();
    }

    // Email validation function
    function validateEmail(email) {
        const re = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
        return re.test(String(email).toLowerCase());
    }

    // Password validation function
    function validatePassword(password) {
        const re = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,}$/;
        return re.test(password);
    }
});
