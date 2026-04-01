# cuda-learning-path

This repository is for **educational purposes only**, intended to learn and practice CUDA development.

## Requirements to run the code

To compile and use the code in this repository, you need an **NVIDIA GPU**.

If you don't have an NVIDIA GPU on your local machine, you can use a cloud environment with GPU support, such as **Google Colab**. You have two options to use it: from your editor (VS Code / Antigravity) using the official extension, or directly from the web browser.

---

### Option 1: Use the official Google Colab extension in VS Code (Recommended)

Google provides an official, native integration in VS Code to run code. To use it:

1. **Install the extension:** In the Extensions tab of your editor, search for the official extension called **"Google Colab"** and install it.
2. **Use a Notebook file:** The extension works with Jupyter notebooks. Create a file in your project with the `.ipynb` extension (e.g., `cuda_practice.ipynb`) and open it.
3. **Connect to Colab GPU:**
   - In the top-right corner of the open file, you’ll see a selector that says "Select Kernel" (or shows the current Python version). Click on it.
   - From the list, select **"Colab"**.
   - You will be prompted to sign in to your Google account. Follow the authorization steps.
   - It will connect automatically. Make sure to request a GPU resource (such as a T4).
4. **Verify and run:**
   - In a notebook cell, you can check the GPU with:
     ```bash
     !nvidia-smi
     ```
   - To work with `.cu` files, the best approach is to create them from the notebook using:
     ```cpp
     %%writefile 02.cu
     // your CUDA code here
     ```
   - Then, in the next cell, compile and run your C++ or CUDA scripts as you would in a terminal:
     ```bash
     !nvcc 02.cu -o app_02
     !./app_02
     ```

---

### Option 2: Use Google Colab in the web browser

1. **Open Google Colab:** Go to https://colab.research.google.com/ and create a new "Notebook".
2. **Enable GPU:** In the top menu, go to **Runtime** > **Change runtime type**. Select **T4 GPU** and save.
3. **Create and run CUDA code:**
   In the first cell:
   ```cpp
   %%writefile 02.cu
   // your CUDA code