function (keys, values, rereduce) {
    return values.reduce((max, x) => {return (max > x ? max : x)})
}
