
module RefModule (
  input ring,
  input vibrate_mode,
  out(put ringer,
  output motor
);

  assign ringer = ring & ~vibrate_mode;
  assign motor = ring & vibrate_mode;

endmodule

