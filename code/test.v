module parking_management_system_tb;

    reg clk;
    reg reset;
    reg car_entered;
    reg car_exited;
    reg is_uni_car_entered;
    reg is_uni_car_exited;

    wire [9:0] uni_parked_car;
    wire [9:0] parked_car;
    wire [9:0] uni_vacated_space;
    wire [9:0] vacated_space;
    wire uni_is_vacated_space;
    wire is_vacated_space;

    parking_management_system uut (
        .clk(clk), 
        .reset(reset), 
        .car_entered(car_entered), 
        .car_exited(car_exited), 
        .is_uni_car_entered(is_uni_car_entered), 
        .is_uni_car_exited(is_uni_car_exited), 
        .uni_parked_car(uni_parked_car), 
        .parked_car(parked_car), 
        .uni_vacated_space(uni_vacated_space), 
        .vacated_space(vacated_space), 
        .uni_is_vacated_space(uni_is_vacated_space), 
        .is_vacated_space(is_vacated_space)
    );

    always begin
        #5 clk = ~clk;
    end

    task display_state;
        begin
            $display("Time: %0t | Uni Parked: %d | Parked: %d | Uni Vacated: %d | Vacated: %d | Uni Vacated Space: %d | Vacated Space: %d", 
                     $time, uni_parked_car, parked_car, uni_vacated_space, vacated_space, uni_is_vacated_space, is_vacated_space);
        end
    endtask

    initial begin
        clk = 0;
        reset = 0;
        car_entered = 0;
        car_exited = 0;
        is_uni_car_entered = 0;
        is_uni_car_exited = 0;

        reset = 1;
        #10;
        reset = 0;
        #10;

        $display("Test Case 1: Uni Car Enters");
        car_entered = 1;
        is_uni_car_entered = 1;
        #10;
        car_entered = 0;
        is_uni_car_entered = 0;
        display_state();

        $display("Test Case 2: Uni Car Enters");
        car_entered = 1;
        is_uni_car_entered = 1;
        #10;
        car_entered = 0;
        is_uni_car_entered = 0;
        display_state();

        $display("Test Case 3: Non uni Car Enters");
        car_entered = 1;
        is_uni_car_entered = 0;
        #10;
        car_entered = 0;
        is_uni_car_entered = 0;
        display_state();

        $display("Test Case 4: Non uni Car Exits");
        car_exited = 1;
        is_uni_car_exited = 0;
        #10;
        car_exited = 0;
        is_uni_car_exited = 0;
        display_state();

        $display("Test Case 5: Uni Car Exits");
        car_exited = 1;
        is_uni_car_exited = 1;
        #10;
        car_exited = 0;
        is_uni_car_exited = 0;
        display_state();

        $display("Test Case 6: Non uni Car Enters");
        car_entered = 1;
        is_uni_car_entered = 0;
        #10;
        car_entered = 0;
        is_uni_car_entered = 0;
        display_state();

        #6000000; 
        $display("Test Case 7: Non uni Car Enters");
        car_entered = 1;
        is_uni_car_entered = 0;
        #10;
        car_entered = 0;
        is_uni_car_entered = 0;
        display_state();

        $finish;
    end

endmodule

