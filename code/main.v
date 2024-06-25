module parking_management_system (
    input wire clk,
    input wire reset,

    input wire car_entered,
    input wire car_exited,
    input wire is_uni_car_entered,
    input wire is_uni_car_exited,

    output reg [9:0] uni_parked_car,
    output reg [9:0] parked_car,
    output reg [9:0] uni_vacated_space,
    output reg [9:0] vacated_space,
    output reg uni_is_vacated_space,
    output reg is_vacated_space
);

    parameter MAX_PARKING_SPACE = 700;
    parameter MAX_UNI_SPACE = 500;
    parameter CLK_FREQ = 100_000_000;  

    reg [31:0] elapsed_time_cycles;
    reg [9:0] NON_UNI_SPACE;
    reg [3:0] time_threshold;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            elapsed_time_cycles <= 0;
            time_threshold <= 0;
            uni_parked_car <= 0;
            parked_car <= 0;
            uni_vacated_space <= MAX_UNI_SPACE;
            vacated_space <= 200;
            NON_UNI_SPACE <= 200;
            uni_is_vacated_space <= 1;
            is_vacated_space <= 1;
        end else begin
            elapsed_time_cycles <= elapsed_time_cycles + 1;

            if (elapsed_time_cycles > CLK_FREQ * 300 * 60) begin
                time_threshold <= 4'd4;  
            end else if (elapsed_time_cycles > CLK_FREQ * 240 * 60) begin
                time_threshold <= 4'd3;  
            end else if (elapsed_time_cycles > CLK_FREQ * 180 * 60) begin
                time_threshold <= 4'd2;  
            end else if (elapsed_time_cycles > CLK_FREQ * 120 * 60) begin
                time_threshold <= 4'd1;  
            end else begin
                time_threshold <= 4'd0;  
            end

            if (car_entered && is_uni_car_entered) begin
                if (uni_parked_car < MAX_UNI_SPACE && uni_parked_car + parked_car < MAX_PARKING_SPACE) begin
                    uni_parked_car <= uni_parked_car + 1;
                    uni_vacated_space <= uni_vacated_space - 1;
                    uni_is_vacated_space <= 1;
                end else begin
                    uni_is_vacated_space <= 0;
                end

                if (parked_car < NON_UNI_SPACE && uni_parked_car + parked_car < MAX_PARKING_SPACE) begin
                    is_vacated_space <= 1;
                end else begin
                    is_vacated_space <= 0;
                end
            end else if (car_exited && is_uni_car_exited) begin
                if (uni_parked_car > 0) begin
                    uni_parked_car <= uni_parked_car - 1;
                    uni_vacated_space <= uni_vacated_space + 1;
                    uni_is_vacated_space <= 1;
                end
            end else if (car_entered && !is_uni_car_entered) begin
                if (time_threshold == 4'd0) begin
                    NON_UNI_SPACE <= 200;
                end else if (time_threshold == 4'd1) begin
                    NON_UNI_SPACE <= 250;
                end else if (time_threshold == 4'd2) begin
                    NON_UNI_SPACE <= 300;
                end else if (time_threshold == 4'd3) begin
                    NON_UNI_SPACE <= 350;
                end else if (time_threshold == 4'd4) begin
                    NON_UNI_SPACE <= 500;
                end

                if (parked_car + uni_parked_car < MAX_PARKING_SPACE && parked_car < NON_UNI_SPACE) begin
                    parked_car <= parked_car + 1;
                    vacated_space <= vacated_space - 1;

                    if (uni_parked_car < MAX_UNI_SPACE && uni_parked_car + parked_car < MAX_PARKING_SPACE) begin
                        uni_is_vacated_space <= 1;
                    end else begin
                        uni_is_vacated_space <= 0;
                    end

                    if (parked_car < NON_UNI_SPACE && uni_parked_car + parked_car < MAX_PARKING_SPACE) begin
                        is_vacated_space <= 1;
                    end else begin
                        is_vacated_space <= 0;
                    end
                end
            end else if (car_exited && !is_uni_car_exited) begin
                if (parked_car > 0) begin
                    parked_car <= parked_car - 1;
                    vacated_space <= vacated_space + 1;
                    is_vacated_space <= 1;
                end
            end
        end
    end

endmodule
