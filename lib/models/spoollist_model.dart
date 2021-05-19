class SpoolListModel {
  int id;
  String spool,
      pipeClass,
      activity,
      fabrication,
      pressTest,
      presstestNo,
      released,
      weldlogNo,
      weldlogDate,
      blasting,
      blastingDate,
      cleaning,
      cleaningR,
      galv,
      galvNo,
      rubber,
      rubberR,
      paint,
      paintNo,
      shipNo,
      shipDate,
      finalReport;
      // ignore: non_constant_identifier_names
      //fileNo_id;

  SpoolListModel(
      this.spool,
      this.pipeClass,
      this.activity,
      this.fabrication,
      this.pressTest,
      this.presstestNo,
      this.released,
      this.weldlogNo,
      this.weldlogDate,
      this.blasting,
      this.blastingDate,
      this.cleaning,
      this.cleaningR,
      this.galv,
      this.galvNo,
      this.rubber,
      this.rubberR,
      this.paint,
      this.paintNo,
      this.shipNo,
      this.shipDate,
      this.finalReport,
      {this.id});
}
