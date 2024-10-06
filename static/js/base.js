function setActive(link) {
    // Get all nav links
    const links = document.querySelectorAll('.navbar-nav .nav-link');

    // Remove active class from all links
    links.forEach(l => l.classList.remove('active'));

    // Add active class to the clicked link
    link.classList.add('active');
}