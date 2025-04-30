function get_middle_vector(x1, y1, x2, y2, x3, y3)
{
    // Calculate the vectors from P1 to P2 and P1 to P3
    var V1_x = x2 - x1;
    var V1_y = y2 - y1;
    var V2_x = x3 - x1;
    var V2_y = y3 - y1;

    // Normalize both vectors to unit vectors
    var lengthV1 = sqrt(V1_x * V1_x + V1_y * V1_y);
    var lengthV2 = sqrt(V2_x * V2_x + V2_y * V2_y);
    
    if (lengthV1 != 0) {
        V1_x /= lengthV1;
        V1_y /= lengthV1;
    }
    
    if (lengthV2 != 0) {
        V2_x /= lengthV2;
        V2_y /= lengthV2;
    }

    // Add the two normalized vectors together
    var middle_x = V1_x + V2_x;
    var middle_y = V1_y + V2_y;

    // Normalize the resulting middle vector to ensure it's a unit vector
    var lengthMiddle = sqrt(middle_x * middle_x + middle_y * middle_y);
    
    if (lengthMiddle != 0) {
        middle_x /= lengthMiddle;
        middle_y /= lengthMiddle;
    }


    // Return the middle vector
    return { x_pos: middle_x, y_pos: middle_y };
}