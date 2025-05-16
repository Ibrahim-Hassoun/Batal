import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/ml_pose_detector/ml_pose_detector.dart';
import 'package:camera/camera.dart';
import '../../ui/widgets/workout/pose_detector/pose_detector.dart';
import '../../ui/widgets/workout/my_workout/my_workout.dart';
import '../../ui/widgets/workout/leaderboard/leaderboard.dart';
import '../camera_logic/camera_logic.dart';


class WorkoutProvider with ChangeNotifier {
  final List<String> _workouts = [];
  List<String> get workouts => _workouts;
  
 
  
  String _detected_area='';
  String get detected_area => _detected_area;

  String _detected_muscle='';
  String get detected_muscle => _detected_muscle;

  String _detected_exercise ='';
  String get detected_exercise => _detected_exercise;

    
  String _MLFeedback ='';
  String get MLFeedback => _MLFeedback;

  //pose detector section
  void setDetectedArea(String area) {
    _detected_area = area;
    print("this is from provider ${_detected_area ?? "unknown"}");
    
    notifyListeners();
  }

  void setDetectedMuscle(String muscle) {
    
    _detected_muscle = muscle;
     print("this is from provider ${detected_muscle ?? "unknown"}");
    notifyListeners();
  }

  void setDetectedExercice(String exercice) {
   
    _detected_exercise = exercice;
     print("this is from provider ${_detected_exercise ?? "unknown"}");
    notifyListeners();
  }
  void setMLFeedback(String feedback){
    _MLFeedback+='\n';
    _MLFeedback += feedback;
    notifyListeners();
  }
  void resetMLFeedback(){
    _MLFeedback='';
    notifyListeners();
  }



  //camera
  CameraLogic cameraLogic = CameraLogic();
  bool _is_Recording = false;
  bool get is_Recording => _is_Recording;

  CameraDescription? _camera;
  CameraDescription? get camera => _camera;

  void setCamera(CameraDescription? camera) {
    _camera = camera;
   
    notifyListeners();
  }
 

  CameraController? _controller;
  CameraController? get controller => _controller;

  void setController(CameraController? controller) {
    _controller = controller;
    notifyListeners();
  }

  //head controller function
  void toggleRecording(BuildContext context) async{
    
    if(!_is_Recording){
      if(detected_area.isEmpty ||detected_muscle.isEmpty ||detected_exercise.isEmpty){
        setMLFeedback('Choose settings first');
        return;
      }
     
      
      createPoseDetector();
      resetMLFeedback();
      await cameraLogic.initializeCamera(this);
            cameraLogic.streamFrames(context);
      _is_Recording = !_is_Recording;
      notifyListeners();
    }else{
      _is_Recording = !_is_Recording;
      poseDetector!.close();
      cameraLogic.disposeCameraController(this);
      
    }
    notifyListeners();
  }



  //ml pose detector
  PoseDetector? _poseDetector;
  PoseDetector? get poseDetector => _poseDetector;

  void createPoseDetector(){
    if (_poseDetector != null) {
      return;
    }
    final options = PoseDetectorOptions(mode:PoseDetectionMode.stream,model: PoseDetectionModel.base);
    PoseDetector poseDetector = PoseDetector(options: options);
    _poseDetector = poseDetector;
    notifyListeners();
  }

  List<Map<String, Map<String, double>>> _landmarks = [];
  List<Map<String, Map<String, double>>> get landmarks => _landmarks;

  void setLandmarks(List<Map<String, Map<String, double>>> landmarks) {
    _landmarks = landmarks;
    notifyListeners();
  }




  //exercices screen
  String? _selectedMode='all';
  String? get selectedMode => _selectedMode;

  void setSelectedMode(String? mode) {
    _selectedMode = mode;
    notifyListeners();
  }


  

}