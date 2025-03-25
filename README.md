# Robotic Grippers: 3-Finger Parallel vs. Adaptive Gripper  

![Grippers Preview](Endeffector_adaptive_config-3f_1gdl/adaptive_endeffector_medias/assembly_motion.gif)

This repository contains 3D models and documentation for a comparative study between two robotic grippers:  
- **3-Finger Parallel Gripper**  
- **3-Finger Adaptive Gripper** (converted via adaptive phalanx)  

## 📁 Repository Structure  
/models
/parallel_gripper # STL & SolidWorks files
/adaptive_gripper # STL & conversion parts
/docs
report.pdf # Full analysis & test results
assembly_guide.md # Step-by-step build instructions


## 🛠️ Features  
- **3D-Printable Designs**: Optimized STL files for FDM printing  
- **Modular Conversion**: Adapt parallel gripper with printable phalanx  
- **Performance Data**: Force tests & object manipulation comparisons  

## 🖨️ 3D Printing Guide  
| Parameter        | Recommended Value |  
|------------------|-------------------|  
| Material         | PLA+/PETG         |  
| Nozzle           | 0.4mm             |  
| Infill           | 25%               |  
| Supports         | Enabled (for joints)|  

💡 **Pro Tip**: Use `0.2mm layer height` for smoother articulation  

## ⚖️ License  
MIT License - Free for commercial use, modifications, and distribution.  
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)  

## 🔧 Contributing  
1. Fork the repository  
2. Create a branch (`git checkout -b improve-feature`)  
3. Commit changes (`git commit -am 'Add new gripper variant'`)  
4. Push to branch (`git push origin improve-feature`)  
5. Open a Pull Request 
