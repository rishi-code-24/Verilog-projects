module tlc(
    input clk,
    input rst,
    output reg [1:0] state,
    output reg [3:0] cnt
);

parameter RED = 2'b00;
parameter YEL = 2'b01;
parameter GRN = 2'b11;

always @(posedge clk)
begin
    if (rst)
    begin
        state <= RED;
        cnt   <= 0;
    end
    else
    begin
        case(state)

        RED:
        begin
            if (cnt == 5)
            begin
                state <= GRN;
                cnt   <= 0;
            end
            else
                cnt <= cnt + 1;
        end

        GRN:
        begin
            if (cnt == 10)
            begin
                state <= YEL;
                cnt   <= 0;
            end
            else
                cnt <= cnt + 1;
        end

        YEL:
        begin
            if (cnt == 15)
            begin
                state <= RED;
                cnt   <= 0;
            end
            else
                cnt <= cnt + 1;
        end

        default:
        begin
            state <= RED;
            cnt   <= 0;
        end

        endcase
    end
end

endmodule
