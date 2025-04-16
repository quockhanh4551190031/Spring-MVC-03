<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.abc.entities.Place" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #7f00ff, #e100ff);
        }
        .register-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }
    </style>
</head>
<body>
    <div class="register-container text-center">
        <h2 class="mb-4">Create Account</h2>
        <form action="register" method="post" id="registerForm" enctype="multipart/form-data">
            <div class="mb-3">
                <div class="input-group">
                    <span class="input-group-text">👤</span>
                    <input type="text" name="username" class="form-control" placeholder="Tên Đăng Nhập" required>
                </div>
            </div>
            <div class="mb-3">
                <div class="input-group">
                    <span class="input-group-text">🔒</span>
                    <input type="password" name="password" class="form-control" placeholder="Mật Khẩu" required>
                </div>
            </div>
            <div class="mb-3">
                <div class="input-group">
                    <span class="input-group-text">📧</span>
                    <input type="email" name="email" class="form-control" placeholder="Email" required>
                </div>
            </div>
            <div class="mb-3">
                <div class="input-group">
                    <span class="input-group-text">📅</span>
                    <input type="date" name="dateOfBirth" class="form-control" required>
                </div>
            </div>
            <div class="mb-3">
                <div class="input-group">
                    <span class="input-group-text">📍</span>
                    <select name="placeId" class="form-control" required>
                        <option value="">Chọn nơi ở</option>
                        <%
                        List<Place> places = (List<Place>) request.getAttribute("places");
                        if (places != null) {
                            for (Place place : places) {
                        %>
                        <option value="<%= place.getId() %>"><%= place.getName() %></option>
                        <%
                            }
                        }
                        %>
                    </select>
                </div>
            </div>
            <div class="mb-3">
                <div class="input-group">
                    <span class="input-group-text">🖼️</span>
                    <input type="file" id="avatarFile" class="form-control" accept="image/jpeg,image/png">
                    <input type="hidden" name="avatarBase64" id="avatarBase64">
                </div>
            </div>
            <button type="submit" class="btn btn-success w-100">Register</button>
        </form>
        <p class="mt-3">Already have an account? <a href="login">Login here</a></p>
        <p style="color:red;">${error}</p>
    </div>

    <script>
        document.getElementById("registerForm").addEventListener("submit", function(event) {
            const avatarFileInput = document.getElementById("avatarFile");
            const avatarBase64Input = document.getElementById("avatarBase64");

            if (avatarFileInput.files.length > 0) {
                const file = avatarFileInput.files[0];
                const reader = new FileReader();

                reader.onload = function(e) {
                    const base64String = e.target.result;
                    avatarBase64Input.value = base64String;
                    // Gửi form sau khi đã có Base64
                    document.getElementById("registerForm").submit();
                };

                reader.onerror = function() {
                    alert("Không thể đọc file avatar!");
                    event.preventDefault();
                };

                reader.readAsDataURL(file);
                event.preventDefault(); // Ngăn form gửi ngay lập tức
            }
        });
    </script>
</body>
</html>