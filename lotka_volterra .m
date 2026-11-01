% Simulation of Lotka-Volterra Predator-Prey Model
clear; clc; close all;

% 1. تعریف پارامترها (Parameters)
alpha = 1.1;  % نرخ رشد شکار (Prey growth rate)
beta  = 0.4;  % نرخ شکار شدن (Predation rate)
delta = 0.1;  % نرخ تبدیل شکار به شکارچی (Predator growth rate)
gamma = 0.4;  % نرخ مرگ شکارچی (Predator death rate)

% شرایط اولیه (Initial Conditions)
% [شکار اولیه, شکارچی اولیه]
initial_conditions = [10; 5]; 

% بازه زمانی شبیه‌سازی (Time span)
tspan = [0 50];

% 2. حل معادلات دیفرانسیل با استفاده از ode45
% تعریف سیستم معادلات به صورت یک تابع داخلی (Anonymous Function)
lotka_volterra = @(t, z) [
    alpha*z(1) - beta*z(1)*z(2);          % dx/dt (تغییرات شکار)
    delta*z(1)*z(2) - gamma*z(2)          % dy/dt (تغییرات شکارچی)
];

[t, z] = ode45(lotka_volterra, tspan, initial_conditions);

% استخراج نتایج
prey = z(:, 1);
predator = z(:, 2);

% 3. رسم نمودارها (Visualization)

figure('Name', 'Lotka-Volterra Simulation', 'NumberTitle', 'off');

% نمودار اول: تغییرات جمعیت نسبت به زمان
subplot(2, 1, 1);
plot(t, prey, 'b-', 'LineWidth', 2); hold on;
plot(t, predator, 'r-', 'LineWidth', 2);
grid on;
xlabel('Time');
ylabel('Population');
title('Population Dynamics over Time');
legend('Prey (شکار)', 'Predator (شکارچی)');

% نمودار دوم: نمودار فاز (Phase Portrait)
subplot(2, 1, 2);
plot(prey, predator, 'k-', 'LineWidth', 1.5);
grid on;
xlabel('Prey Population');
ylabel('Predator Population');
title('Phase Portrait (Relationship between Prey and Predator)');

fprintf('Simulation completed successfully.\n');
