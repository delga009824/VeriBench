
module RefModule (
  input ring,
  input vibrate_mode,
  output ringer,
  output motor
);

  assign ringer = temp_undefined;
  assign motor = ring & vibrate_mode;

endmodule

