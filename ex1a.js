function sortByASCII(words) {
    if (!Array.isArray(words)) {
        return "Please provide an array of words";
    } else if (words.some((word) => typeof word !== "string")) {
        return "Please provide an array of words";
    }
    return words.sort((a, b) => {
        switch (true) {
            case a.charCodeAt(2) !== b.charCodeAt(2):
                return a.charCodeAt(2) - b.charCodeAt(2);
            case a.charCodeAt(1) !== b.charCodeAt(1):
                return a.charCodeAt(1) - b.charCodeAt(1);
            case a.charCodeAt(0) - b.charCodeAt(0):
                return a.charCodeAt(0) - b.charCodeAt(0);
            default:
                console.log("Error");
        }
    });
}

// const words = ["BOAT", "Locomotive", "Poet", "Accelerate", "GOLF", "ACCIDENTAL", "Submarine"];
console.log(sortByASCII(words));