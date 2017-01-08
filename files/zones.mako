$TTL 3h
% for name, data in sorted(records.items()):
    % for typ, values in sorted(data.items()):
        % for value in sorted(values):
${name} ${typ} ${value}
	% endfor
    % endfor
% endfor
