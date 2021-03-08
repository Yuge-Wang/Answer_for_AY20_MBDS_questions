function v = rates(t, c)
% c is short for concentration.
% c(1):c_E, c(2):c_S, c(3):c_ES, c(4):c_P
    global k1;
    global k2;
    global k3;
    c_E = c(1);
    c_S = c(2);
    c_ES = c(3);
    c_P = c(4);
    
    v_ES = k1 * c_E * c_S - k2 * c_ES - k3 * c_ES;
    v_P = k3 * c_ES;
    v_S = - k1 * c_E * c_S + k2 * c_ES;
    v_E = - k1 * c_E * c_S + k2 * c_ES + k3 * c_ES;
    v = [v_E; v_S; v_ES; v_P];
end

