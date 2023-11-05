function updateHiddenInput(checkbox) {
    const hiddenInput = document.getElementById('notImportantHidden');
    if (checkbox.checked) {
        hiddenInput.value = 1;
    } else {
        hiddenInput.value = 0;
    }
}