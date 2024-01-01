# Readme: Coherence Simulation Scripts

This readme provides an overview of the included MATLAB scripts designed to simulate and analyze the coherence dynamics of lambda-omega oscillators. 
The scripts utilize the XXPAUT and MATLAB environments for simulations. 
If the user does not have access to MATLAB software, it is possible to use open source software such as OCTAVE with minor revisions.

## 1. `lambda_omega.txt`
      - **Description:**
          - Simulation of a single lambda-omega oscillator using XXPAUT.
          - Defines a canonical model representing a normal form near a Hopf bifurcation in the deterministic and uncoupled regime.
          - Best used for generating bifurcation diagrams.
      - **Usage:**
          - Open the code using XXPAUT software.
          - Adjust parameters or initial conditions as needed for your simulation.
          - Run the XXPAUT simulation.

## 2. `lambda_omega_coupled.txt`
      - **Description:**
          - Simulation of two coupled lambda-omega oscillators using XXPAUT.
          - Defines a canonical model representing a normal form near a Hopf bifurcation in the deterministic and coupled regime.
          - Best used for generating bifurcation diagrams.
      - **Usage:**
          - Open the code using XXPAUT software.
          - Adjust parameters or initial conditions as needed for your simulation.
          - Run the XXPAUT simulation.

## 3. `model_sim.m`
      - **Description:**
          - MATLAB function, `model_sim`, simulates a pair of coupled lambda-omega oscillators using the Euler-Maruyama method.
          - Outputs the time evolution of the oscillator states `[x1; y1; x2; y2]`.
      - **Usage:**
          - Copy the `model_sim_Dec4.m` file into your MATLAB working directory.
          - Call the function with appropriate parameters, such as `model_sim_Dec4(delta1, delta2, d1, d2)`.
      - **Output:**
          - Matrix `X` containing the time evolution of the states `[x1; y1; x2; y2]`. Rows correspond to the state variables, and columns represent different time points.

## 4. `phase_calc.m`
      - **Description:**
          - Computes the phase and phase difference of the output of the `model_sim_Dec4` function.
          - Provides options for phase unwrapping and drift correction.
      - **Usage:**
          - Set the parameters 'delta1', 'd1', 'd2', 'delta2'.
          - Run the script to compute phase information.
      - **Output:**
          - pdiff: Computed and normalized phase difference between oscillators.

## 5. `coherence_measures.m`
      - **Description:**
          - Computes the coherence measures of in-phase synchronization and demonstrates coherence resonance phenomena by iterating over noise intensities.
      - **Usage:**
          - Adjust parameters such as 'N', 'dt', 't_end', 't0', 'd1', and 'd2' based on your requirements.
          - Modify 'delta1_vec' and 'delta2_vec' to include the desired noise strengths for oscillators 1 and 2.
          - Execute the script to perform simulations and compute coherence measures.
      - **Output:**
          - Coherence measures: mean phase coherence and mean absolute phase difference.

## Additional Information:
- Ensure MATLAB is set up and functional in your environment.
- Please ensure you have the XXPAUT environment set up before running the scripts.
