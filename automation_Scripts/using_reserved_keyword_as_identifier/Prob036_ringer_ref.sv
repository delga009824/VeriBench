
module RefModule (
  input ring,
  input if,
  output ringer,
  output motor
);

  assign ringer = ring & ~vibrate_mode;
  assign motor = ring & vibrate_mode;

endmodule

