class Robot {
  String name;
  String status;
  int shield;
  int shots;
  ////config stuff////
  int visibilityRange;
  int reloadTime;
  int repairTime;
  int setMineTime;

  Robot(this.name, this.status, this.shield, this.reloadTime, this.repairTime,
      this.setMineTime, this.shots, this.visibilityRange);

  // Robot.fromJson(Map<String, dynamic> json):

}
